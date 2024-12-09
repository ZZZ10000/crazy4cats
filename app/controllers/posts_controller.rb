class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "Publicación creada exitosamente."
    else
      render :new, alert: "Error al crear la publicación."
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Publicación actualizada exitosamente."
    else
      render :edit, alert: "Error al actualizar la publicación."
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Publicación eliminada exitosamente."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
