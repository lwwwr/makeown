class RemaneOrderCategoriesToOrderCategory < ActiveRecord::Migration[5.2]
  def change
    rename_table :order_categories, :order_category
  end
end
