class AddChosedColumnIntoOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :chosed, :boolean, default: nil
  end
end
