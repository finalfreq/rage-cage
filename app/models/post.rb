class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :image, uniqueness: true

  default_scope { order(created_at: :desc) }
end
