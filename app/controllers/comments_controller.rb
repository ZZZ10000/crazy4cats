class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user if user_signed_in?

    if @comment.save
      redirect_to post_path(@post), notice: "Comentario agregado exitosamente."
    else
      redirect_to post_path(@post), alert: "Error al agregar el comentario."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
