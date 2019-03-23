class SigninController < ApplicationCotroller
    before_action :authorize_access_request!, only: [:destroy]

    def create
        user = User.find_by(email: params[:email])

        if user.authenticate(params[:password])
            payload = {user_id: user.id}
            session = JWTSession::Session.new(
                                            payload: payload, 
                                            refresh_by_access_allowed: true
                                            )
            tokens = session.login
            response.set_cookie(
                                JWTSession.access_cookie,
                                value: tokens[:access],
                                httponly: true,
                                secure: Rails.env.production?
                                )
            render json: {csrf: tokens[:csrf]}
        else
            not_authorized #it's coming from signup controller
        end
    end

    def destroy
        session = JWTSession::Session.new(payload: payload)
        session.flush_by_access_payload
        render json: :ok
    end


    private

    def not_found
        render json: {error: 'Email or password is wrong'}, status: :not_found
    end
end