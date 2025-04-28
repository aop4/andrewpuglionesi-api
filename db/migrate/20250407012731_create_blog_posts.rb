class CreateBlogPosts < ActiveRecord::Migration[7.2]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :body_markdown
      t.string :header_image_url
      t.boolean :pinned, :default => false

      t.timestamps
    end
  end
end
