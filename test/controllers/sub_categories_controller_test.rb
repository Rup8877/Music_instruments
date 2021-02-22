require 'test_helper'

class SubCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sub_categories_index_url
    assert_response :success
  end

  test "should get new" do
    get sub_categories_new_url
    assert_response :success
  end

end
