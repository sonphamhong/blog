class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :likes

  def likes_count
    binding.pry
    self.update_attribute(:likes_count, self.likes.count)
  end
end
