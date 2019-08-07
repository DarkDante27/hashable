class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string, unique: true, null: false, default: ""
    add_column :users, :bio, :text
    add_column :users, :avatar, :string
  end
end
