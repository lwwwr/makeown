class OrderConclusion < ApplicationRecord
  belongs_to :order
  has_many :user_reputation
end
