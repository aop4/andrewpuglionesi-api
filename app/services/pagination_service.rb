# A generic pagination utility. It is designed to be failsafe, returning the
# first page when the input is faulty and the last page when the requested page
# is too large.
class PaginationService
  
  # items_per_page is the number of items to display on a single page.
  # model_class is the model to paginate (required to obtain the number
  # of records for that model in the database).
  def initialize(items_per_page, model_class)
    if items_per_page <= 0
      raise ArgumentError, 'Items per page must be positive'
    end
    @items_per_page = items_per_page
    @model_class = model_class
  end

  # Takes the page number and transforms it into something that can be used
  # if it is invalid. If it's less than 1, this returns 1. If it's too
  # large for the data set, this returns the last page. This way, pagination
  # never catastrophically fails.
  def get_validated_page_num(page_num)
    if page_num.nil? || page_num <= 0
      return 1
    end
    max_page_num = get_num_pages
    if max_page_num.zero?
      return 1
    end
    if page_num > max_page_num
      return max_page_num
    end
    page_num
  end

  # Returns the database offset for the result set on the page_numth page. 
  # Offset 0 returns the first record onward, offset 1 the second
  # record onward, and so on. If the page number is too high, the offset
  # for the last valid page is returned. I do not "slice" the data here, so that
  # complex queries (e.g., those involving sorting) can be done all at once and
  # thus optimized.
  def get_result_set_offset(page_num)
    page_num = get_validated_page_num(page_num)
    @items_per_page * (page_num -1)
  end

  # Returns the number of pages to display given the count of items and the
  # number of items to put on each page
  def get_num_pages
    record_count = @model_class.count
    if record_count % @items_per_page == 0
      (record_count / @items_per_page)
    else
      (record_count / @items_per_page) + 1
    end
  end

end
