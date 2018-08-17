class RemaneUserInfosToUserInfo < ActiveRecord::Migration[5.2]
  def change
    rename_table :user_infos, :user_info
  end
end
