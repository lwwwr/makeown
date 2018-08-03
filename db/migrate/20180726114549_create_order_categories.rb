class CreateOrderCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :order_categories do |t|
      t.references :order, foreign_key: true
      t.references :categories, foreign_key: true

      t.timestamps
    end
  end
end
