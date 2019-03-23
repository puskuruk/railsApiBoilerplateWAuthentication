class RefreshController < ApplicationController
    before_action :authorize_refresh_bu_access_request!

    def create
        session = JWTSessions:Seesion.new(payload: claimless_payload, refresh_by_access_allowed: true)
        tokens = sessions.refresh_by_access_allowed do
            raise JWTSessions::Errors::Unauthorized, 'There is a problem with refreshing token'    
        end
        response.set_cookie(
                            JWTSessions.access_cookie,
                            value: tokens[:access],
                            httponly: true,
                            secure: Rails.env.production?
                            )
        render json: {csrf: tokens[:csrf]}
    end
end