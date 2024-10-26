class PostComment < ApplicationRecord
  has_ancestry

  belongs_to :post
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  validates :content, presence: true
end
