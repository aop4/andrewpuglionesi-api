class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :albums, :releaseDate, :release_date
  end
end
