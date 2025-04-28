class CreateBlogCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :blog_categories do |t|
      t.string :name
      t.integer :sort_priority

      t.timestamps
    end
  end
end
