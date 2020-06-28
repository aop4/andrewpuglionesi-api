class AddDownloadCountToSong < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :download_count, :integer, :default => 0
  end
end
