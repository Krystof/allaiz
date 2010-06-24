class MessagesController < ApplicationController
 
  before_filter :ensure_login, :only => [:edit, :update, :destroy, :index]

 
  def index
	requete = "select m.* from messages m, receptions r where m.id = r.message_id AND r.user_id = " + String(@current_user.id)
    @messages = Message.find_by_sql(requete)
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mesages }
    end
  end
  
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
  end 
  
  def create
    @message = Message.new(params[:message])
	@reception = Reception.new
	@reception.user_id = @message.user_id
	@message.user_id = @current_user.id
	
	
    respond_to do |format|
	  if @message.save
		@reception.message_id =@message.id
		@reception.etat = 1
		@reception.save  	  
        flash[:notice] = 'Tu vien d\'envoyer un message &agrave; : ' 
        format.html { redirect_to(messages_path) }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end  
  
end
