class AddSpanishTextToNewsItems < ActiveRecord::Migration[5.2]
  def change
    add_column :news_items, :spanish_text, :string
  end
end
