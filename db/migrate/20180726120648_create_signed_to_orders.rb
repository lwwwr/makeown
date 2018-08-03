class CreateSignedToOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :signed_to_orders do |t|
      t.references :order, foreign_key: true
      t.integer :signed_id, index: {unique: true}
      t.integer :price
      t.boolean :accepted

      t.timestamps
    end
  end
end
