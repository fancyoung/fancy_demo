class PostsController < ApplicationController
  before_filter :authenticate_user!, :only =>[:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])

  end

  def new
    @post = Post.new
  end

  def create
    params[:post][:creater_id] = current_user.id
    params[:post][:updater_id] = current_user.id
    @post = Post.new(params[:post])
    if @post.save
      redirect_to @post, :notice => "Successfully created post."
    else
      render :action => 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    params[:post][:updater_id] = current_user.id
    if @post.update_attributes(params[:post])
      redirect_to @post, :notice  => "Successfully updated post."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, :notice => "Successfully destroyed post."
  end
end
