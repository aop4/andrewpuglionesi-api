class AddPlayCountColumnToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :play_count, :integer, :default => 0
  end
end
