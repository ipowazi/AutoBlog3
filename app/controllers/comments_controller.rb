class CommentsController < ApplicationController
  def new
  	@comment = Comment.new
  	# @post = @comment.post
  end

  def create
  	@comment = Comment.new(params[:comment])
  	@comment.save
  	redirect_to @comment, :notice => "Comment created!"
  end

  def show
  	@comment = Comment.find(params[:id])
  end

  def index
  	@comments = Comment.all
  end

  def edit
  	@comment = Comment.find(params[:id])
  end

  def update
  	@comment = Comment.find(params[:id])
  	@comment.update_attributes(params[:comment])
  	redirect_to @comment, :notice => "Comment updated"
  end

  def delete
  	@comment = Comment.find(params[:id])
  	@comment.destroy
  	redirect_to comments_path, :notice => "Comment deleted"
  end

end
