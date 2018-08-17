class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,  :validatable, :confirmable #:trackable
  has_one :user_info, dependent: :delete
  has_many :user_categories
  has_many :categories, through: :user_categories
  has_many :orders
  has_many :order_conclusions, through: :user_reputations
  has_many :user_reputations
end
