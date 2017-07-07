class AddUserLevelToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_level, :integer, null: false, default: 0
  end
end
