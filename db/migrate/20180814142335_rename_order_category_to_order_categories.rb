class RenameOrderCategoryToOrderCategories < ActiveRecord::Migration[5.2]
  def change
    rename_table :order_category, :order_categories
  end
end
