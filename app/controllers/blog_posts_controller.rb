class BlogPostsController < ApplicationController

  def index
    @categories = BlogCategory.order(sort_priority: :asc)
    render json: @categories.to_json(:include => :blog_posts)
  end

  def show
    @blog_post = BlogPost.find_by(path: params[:path])
    render json: @blog_post
  end

end
