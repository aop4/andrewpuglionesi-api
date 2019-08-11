require 'minitest/unit'
require 'minitest/autorun'
require_relative '../app/services/pagination_service'

class PaginationServiceTest < Minitest::Test

  def setup
    @mock_models = Minitest::Mock.new
  end

  def get_num_pages_helper(items_per_page, item_count, expected_num_pages)
    @mock_models.expect(:count, item_count)
    pagination_service = PaginationService.new(items_per_page, @mock_models)
    assert_equal(expected_num_pages, pagination_service.get_num_pages)
  end

  def test_get_num_pages_no_items
    get_num_pages_helper(4, 0, 0)
  end

  def test_get_num_pages_less_than_a_page_worth_of_items
    get_num_pages_helper(4, 1, 1)
  end

  def test_get_num_pages_exactly_a_page_worth_of_items
    get_num_pages_helper(4, 4, 1)
  end

  def test_get_num_pages_between_one_and_two_pages_worth_of_items
    get_num_pages_helper(4, 5, 2)
  end

  def test_get_num_pages_exactly_two_pages_worth_of_items
    get_num_pages_helper(4, 8, 2)
  end

  def test_get_num_pages_one_item_per_page
    get_num_pages_helper(1, 2, 2)
  end

  def test_initialize_zero_items_per_page_throws_argument_error
    assert_raises ArgumentError do
      pagination_service = PaginationService.new(0, @mock_models)
    end
  end

  def test_initialize_negative_items_per_page_throws_argument_error
    assert_raises ArgumentError do
      pagination_service = PaginationService.new(-1, @mock_models)
    end
  end

  def get_result_set_offset_helper(items_per_page, num_pages, page_num,
      expected_offset)
    pagination_service = PaginationService.new(items_per_page, nil)
    pagination_service.stub :get_num_pages, num_pages do
      assert_equal(expected_offset, pagination_service.get_result_set_offset(page_num))
    end
  end

  def test_get_result_set_offset_page_num_nil
    get_result_set_offset_helper(4, 4, nil, 0)
  end

  def test_get_result_set_offset_page_num_zero
    get_result_set_offset_helper(4, 4, 0, 0)
  end

  def test_get_result_set_offset_page_one
    get_result_set_offset_helper(4, 4, 1, 0)
  end

  def test_get_result_set_offset_page_in_the_middle
    get_result_set_offset_helper(4, 4, 3, 8)
  end

  def test_get_result_set_offset_last_page
    get_result_set_offset_helper(4, 4, 4, 12)
  end

  def test_get_result_set_offset_page_num_too_high
    get_result_set_offset_helper(4, 4, 5, 12) # page 5 doesn't exist, so should
                                              # return offset for page 4
  end

  def test_get_result_set_offset_zero_pages_present
    get_result_set_offset_helper(4, 0, 2, 0) # no content to load, so offset
                                             # should be 0
  end

  def test_get_result_set_offset_one_item_per_page
    get_result_set_offset_helper(1, 4, 2, 1)
  end

  def get_validated_page_num_helper(num_pages, requested_page, expected)
    pagination_service = PaginationService.new(1, nil)
    pagination_service.stub :get_num_pages, num_pages do
      assert_equal(expected, pagination_service.get_validated_page_num(requested_page))
    end
  end

  def test_get_validated_page_num_nil_page_num
    get_validated_page_num_helper(4, nil, 1)
  end

  def test_get_validated_page_num_negative_page_num
    get_validated_page_num_helper(4, -1, 1)
  end

  def test_get_validated_page_num_zero_page_num
    get_validated_page_num_helper(4, 0, 1)
  end

  def test_get_validated_page_num_greater_than_max
    get_validated_page_num_helper(4, 5, 4)
  end

  def test_get_validated_page_num_equal_to_max
    get_validated_page_num_helper(4, 4, 4)
  end

  def test_get_validated_page_num_max_is_zero
    get_validated_page_num_helper(0, 1, 1)
  end

  def test_get_validated_page_num_between_max_and_min
    get_validated_page_num_helper(4, 2, 2)
  end

end
