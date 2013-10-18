class PostsController < ApplicationController
  include ContextValidations::Controller

  def index
    @posts = Post.all.order('id DESC')
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.validations = validations

    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.validations = validations

    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def destroyed
    @posts = Post.destroyed
  end

  def restore
    @post = Post.unscoped.find(params[:post_id])
    @post.restore
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def base_validations
    validates :title, presence: true, uniqueness: { conditions: -> { where(destroyed_at: nil) } }
    validates :content, presence: true
  end
end
