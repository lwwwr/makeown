class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :users, foreign_key: true
      t.string :desc
      t.string :address
      t.integer :who
      t.boolean :status
      t.datetime :end_data

      t.timestamps
    end
  end
end
