class CommentsController < ApplicationController 
	def index 
		@user = User.find(params[:user_id])  
		@comments = @user.comments 
	end  
	
	def show 
		@user = User.find(params[:user_id])  
		@comment = @user.comments.find(params[:id])  
	end  
	
	def new 
		@user = User.find(params[:user_id])  
		@comment = @user.comments.build 
	end  
	
	def create 
		@user = User.find(params[:user_id])  
		@comment = @user.comments.build(params[:comment])  
		if @comment.save 
			redirect_to user_comment_url(@user, @comment)  
		else 
			render :action => "new"  
		end  
	end  
	
	def edit 
		@user = User.find(params[:user_id])  
		@comment = @user.comments.find(params[:id])  
	end  
	
	def update 
		@user = User.find(params[:user_id])  
		@comment = Comment.find(params[:id])  
		if @comment.update_attributes(params[:comment])  
			redirect_to user_comment_url(@user, @comment)  
		else  
			render :action => "edit"  
		end  
	end  
	
	def destroy 
		@user = User.find(params[:user_id])  
		@comment = Comment.find(params[:id])  
		@comment.destroy respond_to do |format| 
			format.html { redirect_to user_comments_path(@user) } 
			format.xml { head :ok } 
		end  
	end 
end 