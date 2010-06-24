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
      flash[:notice] = "Bonjour #{@session.user.prenom}, vous &ecirc;tes maintenant connect&eacute;."
      redirect_to(root_url)
    else     
		@error_message = "Bonjour, vous &ecirc;tes maintenant connect&eacute;."
		render(:action => 'new')
    end
  end
 
  def destroy
		Session.destroy(@application_session)
		session[:id] = @user = nil
		flash[:notice] = "Vous &ecirc;tes deconnect&eacute;."
		redirect_to(root_url)
  end

end
