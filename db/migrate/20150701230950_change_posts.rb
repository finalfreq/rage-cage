class ChangePosts < ActiveRecord::Migration
  def change
    change_column :posts, :wins, :integer, default: 0
    change_column :posts, :losses, :integer, default: 0

  end
end
