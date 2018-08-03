class CreateUserInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_infos do |t|
      t.references :users, foreign_key: true
      t.string :fio
      t.string :about
      t.string :education
      t.string :skills
      t.string :experience
      t.string :city

      t.timestamps
    end
  end
end
