class Order < ApplicationRecord
  belongs_to :user
  has_one :category, through: :order_category
  has_many :signed_to_orders
  has_one :order_conclusion
end
