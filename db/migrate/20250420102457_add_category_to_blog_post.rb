class AddCategoryToBlogPost < ActiveRecord::Migration[7.2]
  def change
    add_reference :blog_posts, :blog_category, null: false, foreign_key: true
  end
end
