class SignedToOrder < ApplicationRecord
  belongs_to :order
  validates :order_id, :uniqueness => { :scope => :signed_id }
  validates :price, presence: true
end
