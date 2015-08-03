class HomeController < ApplicationController
  def index
    @posts = Post.order(:likes_count)
    @hash_data = []
    @posts.in_groups_of(2) {|group| @hash_data.push(group)}
  end
end
