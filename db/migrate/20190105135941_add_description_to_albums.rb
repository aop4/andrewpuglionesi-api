class AddDescriptionToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :description, :string
    add_column :albums, :spanish_desc, :string
  end
end
