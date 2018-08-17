class RenameUserInfoToUserInfos < ActiveRecord::Migration[5.2]
  def change
    rename_table :user_info, :user_infos
  end
end
