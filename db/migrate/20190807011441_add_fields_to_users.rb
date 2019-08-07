class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string, unique: true
    add_column :users, :bio, :text
    add_column :users, :avatar, :string
  end
end
