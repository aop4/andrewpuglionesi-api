class ChangeSpanishDescToBeTextInAlbums < ActiveRecord::Migration[5.2]
  def change
    change_column :albums, :spanish_desc, :text
  end
end
