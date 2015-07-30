class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :likes

  def likes_count
    self.update_attribute(:likes_count, likes.count)
  end
end
