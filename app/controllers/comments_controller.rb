class CommentsController < ApplicationController
  include ContextValidations::Controller

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.validations = validations

    if @comment.save
      redirect_to post_path(params[:post_id])
    else
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def base_validations
    validates :content, presence: true
  end
end
