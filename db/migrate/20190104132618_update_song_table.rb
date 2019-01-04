class UpdateSongTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :file
    add_column :songs, :file_path, :string, :default => '/songs/'
    change_column_default :songs, :filetype, 'mp3'
    add_column :songs, :track_no, :integer
  end
end
