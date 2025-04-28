class AddPathToBlogPost < ActiveRecord::Migration[7.2]
  def change
    add_column :blog_posts, :path, :string, null: false
    add_index :blog_posts, :path, unique: true
  end
end
