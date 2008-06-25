class SentryController < ApplicationController
  def login
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        uri = session[:original_uri]
        session[:original_uri] = nil
        redirect_to(uri || verifications_url)
      else
        flash.now[:notice] = "Invalid email/password combination."
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out."
    redirect_to(:action => "login")
  end

end
