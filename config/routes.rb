Rails.application.routes.draw do
  get 'signup/create'
  namespace :api do
    namespace :v1 do
      #there will be routes which will be /api/v1/...
      #in those controllers if we want authenticated users we must use
      # before_action :authorize_access_request!
    end
  end
  #sign in controller which handles sign in and  sign out
  post "signin", controller: :signin, action: :create
  delete "signin", controller: :signin, action: :destroy
  #signup controller create user
  post "signup", controller: :signup, action: :create
  #refresh token
  post "refresh", controller: :refresh, action: :create
end
