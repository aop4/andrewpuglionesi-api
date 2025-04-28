class BlogPost < ApplicationRecord
  belongs_to :blog_category
  validates :title, :presence => true
  validates :body_markdown, :presence => true
  validates :path, :presence => true
  validates :path, :uniqueness => true
end
