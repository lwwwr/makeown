class ChangeForeignKeyForUserInfo < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_info, :users_id, :user_id
  end
end
