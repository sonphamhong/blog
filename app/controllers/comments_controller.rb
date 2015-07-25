class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find_by(id: params[:post_id])
    comment = current_user.comments.create(post_id: @post.id, content: params[:comment][:content])
    redirect_to @post
  end
end
