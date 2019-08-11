require_relative '../services/pagination_service'

class NewsItemsController < ApplicationController

  ITEMS_PER_PAGE = 4

  def index
    requested_page = params[:pageNum].to_i
    @news_items = retrieve_data(requested_page)
    render json: { 
      'data' => @news_items,
      'numPages' => @pagination_service.get_num_pages,
      'currPage' => @pagination_service.get_validated_page_num(requested_page)
    }
  end

  def retrieve_data(requested_page)
    @pagination_service = PaginationService.new(ITEMS_PER_PAGE, NewsItem)
    result_set_offset = @pagination_service.get_result_set_offset(requested_page)
    NewsItem.order(item_date: :desc).limit(ITEMS_PER_PAGE).offset(result_set_offset)
  end

end
