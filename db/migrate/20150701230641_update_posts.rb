class UpdatePosts < ActiveRecord::Migration
  def change
    remove_column :posts, :rating
    add_column :posts, :wins, :integer
    add_column :posts, :losses, :integer
  end
end
