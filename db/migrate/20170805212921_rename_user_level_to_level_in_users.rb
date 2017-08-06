class RenameUserLevelToLevelInUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :user_level, :level
  end
end
