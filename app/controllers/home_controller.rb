class HomeController < ApplicationController
  def index
    @posts = Post.order(:likes_count)
  end
end
