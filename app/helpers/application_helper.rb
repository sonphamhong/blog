module ApplicationHelper

  def is_owner?(post)
    current_user == post.user ? true : false 
  end
end
