class Order < ApplicationRecord
  belongs_to :user
  has_one :order_category, dependent: :delete
  has_one :category, through: :order_category
  has_many :signed_to_orders, dependent: :destroy
  has_one :order_conclusion, dependent: :delete



  def not_customer?(other_user)
    other_user.id != self.user_id
  end

  def signed?(other_user)
    signed_to_orders.find_by(signed_id: other_user.id)
  end

  # def sign!(other_user)
  #   signed_to_orders.create!(signed_id: other_user.id)
  # end

  def unsign!(other_user)
    signed_to_orders.find_by(signed_id: other_user.id).destroy!
  end


end
