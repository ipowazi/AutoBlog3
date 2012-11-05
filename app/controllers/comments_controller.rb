class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
  	@comment = @post.comments.new
  	# @post = @comment.post
  end

  def create
    @post = Post.find(params[:post_id])
  	@comment = @post.comments.new(params[:comment])
  	if @comment.save
  	  redirect_to @comment, :notice => "Comment created!"
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  def show
  	@comment = Comment.find(params[:id])
  end

  def index
    if params[:post_id]
      @comments = Post.find(params[:post_id]).comments
    else
    	@comments = Comment.all
    end
  end

  def edit
  	@comment = Comment.find(params[:id])
  end

  def update
  	@comment = Comment.find(params[:id])
  	@comment.update_attributes(params[:comment])
  	redirect_to @comment, :notice => "Comment updated"
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy
  	redirect_to comments_path, :notice => "Comment deleted"
  end

end
