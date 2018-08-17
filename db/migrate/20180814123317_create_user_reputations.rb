class CreateUserReputations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reputations do |t|
      t.references :user, foreign_key: true
      t.references :order_conclusion, foreign_key: true

      t.timestamps
    end
  end
end
