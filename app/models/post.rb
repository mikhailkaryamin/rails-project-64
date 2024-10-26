class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  has_many :comments, class_name: "PostComment", dependent: :destroy

  validates :body, presence: true
  validates :title, presence: true
end
