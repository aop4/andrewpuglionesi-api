class CreateNewsItems < ActiveRecord::Migration[5.2]
  def change
    create_table :news_items do |t|
      t.date :item_date
      t.text :text

      t.timestamps
    end
  end
end
