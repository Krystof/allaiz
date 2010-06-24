# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

 
  before_filter :maintain_session_and_user
 
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  
  def ensure_login
    unless @current_user
      flash[:notice] = "Please login to continue"
      redirect_to(new_session_path)
    end
  end
  
  def ensure_logout
    if @current_user
      flash[:notice] = "You must logout before you can login or register"
      redirect_to(root_url)
    end
  end
  
  def ensure_admin
	unless @current_user and @current_user.is_admin?
		flash[:notice] = "Vous devez &ecirc;tre un mod&eacute;rateur pour avoir acc&egrave;s &agrave; cette section"
        redirect_to(root_url)
	end
  end
  
  private
  
  def maintain_session_and_user
    if session[:id]
      if @application_session = Session.find_by_id(session[:id])
	   @application_session.update_attributes(
          :ip_address => request.remote_addr,
          :path => request.path_info
        )
        @current_user = @application_session.user
      else
        session[:id] = nil
        redirect_to(root_url)
      end
    end
  end  
  
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
