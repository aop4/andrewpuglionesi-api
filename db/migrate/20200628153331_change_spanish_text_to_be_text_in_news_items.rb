class ChangeSpanishTextToBeTextInNewsItems < ActiveRecord::Migration[5.2]
  def change
    change_column :news_items, :spanish_text, :text
  end
end
