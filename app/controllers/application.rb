# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :authorize, :except => :login
  layout 'index'
  session :session_key => '_keeper_session_id'
  
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :secret => 'ac1677548ac960cd300e7ed737b47af4'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  protected
    def authorize
      unless User.find_by_id(session[:user_id])
        session[:original_uri] = request.request_uri
        flash[:notice] = "Please log in."
        redirect_to :controller => :sentry, :action => :login
      end
    end
  
end
