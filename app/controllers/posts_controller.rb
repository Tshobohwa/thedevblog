class PostsController < ApplicationController
  def index
    user_id = params[:user_id]
    @user = User.find(user_id)
    @posts = Post.where({ author_id: user_id })
  end

  def show
    id = params[:id]
    author_id = params[:user_id]
    @post_author = User.find(author_id).name
    @post = Post.find(id)
    @likes = @post.likes_counter
    @comments_count = @post.comments_counter
    @comments = Comment.where(post_id: id)
  end
end
