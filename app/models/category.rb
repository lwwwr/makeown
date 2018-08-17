class Category < ApplicationRecord
  has_many :user_categories
  has_many :order_categories
end
