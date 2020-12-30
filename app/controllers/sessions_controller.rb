class SessionsController < ApplicationController
  def create_omniauth
    if session[:user_id]
      User.find(session[:user_id].id).add_provider(auth)
      
      render text: "log in with #{auth['provider']} successful"
    else
      auth_user = Identity.find_or_create(auth)
      session[:user_id] = auth_user.user.id
      
      render text: 'Log in successful'
    end
  end

  protected
  def auth
    request.env['omniauth.auth']
  end

end
