class AddRatingToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :rating, :int, default: 0
  end
end
