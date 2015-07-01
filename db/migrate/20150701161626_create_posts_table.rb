class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.timestamps
      t.column :title, :string
      t.column :image, :string
      t.column :user_id, :int
      t.column :description, :string
    end
  end
end
