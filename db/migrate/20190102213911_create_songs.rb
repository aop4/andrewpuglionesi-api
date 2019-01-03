class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.text :lyrics
      t.string :title
      t.binary :file
      t.string :filetype
      t.references :album, foreign_key: true
      t.string :artist

      t.timestamps
    end
  end
end
