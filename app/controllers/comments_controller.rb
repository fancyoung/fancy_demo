class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @post =Post.find(params[:post_id])
    if user_signed_in?
      params[:comment][:creater_id] = current_user.id
      params[:comment][:updater_id] = current_user.id
    end
    @comment = @post.comments.create(params[:comment])
    respond_to do |format|
      if @comment.save
        format.js { @current_comment = @comment }
        #redirect_to post_path(@post), :notice => "Successfully created comment."
      else
        redirect_to post_path(@post), :notice => "Error when create comment."
      end
    end
  end

  def destroy
    @post =Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), :notice => "Successfully destroyed comment."
  end
end
