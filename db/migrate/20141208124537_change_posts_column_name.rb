class ChangePostsColumnName < ActiveRecord::Migration
  def change
    rename_column :posts, :author, :user_id
  end
end
