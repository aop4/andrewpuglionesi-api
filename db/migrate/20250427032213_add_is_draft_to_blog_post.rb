class AddIsDraftToBlogPost < ActiveRecord::Migration[7.2]
  def change
    add_column :blog_posts, :is_draft, :boolean, :default => false
  end
end
