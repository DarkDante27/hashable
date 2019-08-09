class AddPictureToMiniposts < ActiveRecord::Migration[5.2]
  def change
    add_column :miniposts, :picture, :string
  end
end
