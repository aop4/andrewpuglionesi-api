class BlogCategory < ApplicationRecord
  has_many :blog_posts, -> { order('pinned DESC, created_at DESC') }
end
