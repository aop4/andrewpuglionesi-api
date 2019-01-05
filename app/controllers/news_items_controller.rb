class NewsItemsController < ApplicationController
  
  def index
    @news_items = NewsItem.order(item_date: :desc)
    render json: @news_items
  end

end
