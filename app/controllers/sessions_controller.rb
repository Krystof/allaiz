class SessionsController < ApplicationController
  before_filter :ensure_login, :only => :destroy
  before_filter :ensure_logout, :only => [:new, :create]
 
  def index
    redirect_to(new_session_path)
  end
 
  def new
   @session = Session.new
  end
 
  def create
    @session = Session.new(params[:session])
    if @session.save
      session[:id] = @session.id
      flash[:notice] = "Hello #{@session.user.prenom}, you are now logged in"
      redirect_to(root_url)
    else     
		@error_message = "Hello  you are now logged in"
		render(:action => 'new')
    end
  end
 
  def destroy
    Session.destroy(@application_session)
    session[:id] = @user = nil
    flash[:notice] = "You are now logged out"
    redirect_to(root_url)
  end

end
