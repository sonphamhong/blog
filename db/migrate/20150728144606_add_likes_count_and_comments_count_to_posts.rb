class AddLikesCountAndCommentsCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :likes_count, :integer
    add_column :posts, :comments_count, :integer
  end
end
