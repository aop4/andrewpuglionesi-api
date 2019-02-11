class AddAlbumArtPathToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :album_art_path, :string, :default => '/images/'
  end
end
