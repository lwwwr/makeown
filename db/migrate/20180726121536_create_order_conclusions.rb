class CreateOrderConclusions < ActiveRecord::Migration[5.2]
  def change
    create_table :order_conclusions do |t|
      t.references :order, foreign_key: true
      t.boolean :positive
      t.boolean :negative
      t.string :comment
      t.decimal :rate_price
      t.decimal :rate_quality
      t.decimal :rate_civility

      t.timestamps
    end
  end
end
