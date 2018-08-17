class ChangeForeignKeyForOrderCategories < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_categories, :categories_id, :category_id
  end
end
