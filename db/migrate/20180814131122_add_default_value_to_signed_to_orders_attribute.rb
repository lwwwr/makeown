class AddDefaultValueToSignedToOrdersAttribute < ActiveRecord::Migration[5.2]
  def change
    change_column :signed_to_orders, :accepted, :boolean, default: false
  end
end
