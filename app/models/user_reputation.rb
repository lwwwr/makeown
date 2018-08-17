class UserReputation < ApplicationRecord
  belongs_to :user
  belongs_to :order_conclusion
end
