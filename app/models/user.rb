# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :restrict_with_exception
  has_many :post_comments, dependent: :restrict_with_exception
  has_many :likes, class_name: 'PostLike', dependent: :destroy
end
