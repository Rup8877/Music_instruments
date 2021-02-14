require 'test_helper'

class MusicInstrumentsCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @music_instruments_category = music_instruments_categories(:one)
  end

  test "should get index" do
    get music_instruments_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_music_instruments_category_url
    assert_response :success
  end

  test "should create music_instruments_category" do
    assert_difference('MusicInstrumentsCategory.count') do
      post music_instruments_categories_url, params: { music_instruments_category: { name: @music_instruments_category.name } }
    end

    assert_redirected_to music_instruments_category_url(MusicInstrumentsCategory.last)
  end

  test "should show music_instruments_category" do
    get music_instruments_category_url(@music_instruments_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_music_instruments_category_url(@music_instruments_category)
    assert_response :success
  end

  test "should update music_instruments_category" do
    patch music_instruments_category_url(@music_instruments_category), params: { music_instruments_category: { name: @music_instruments_category.name } }
    assert_redirected_to music_instruments_category_url(@music_instruments_category)
  end

  test "should destroy music_instruments_category" do
    assert_difference('MusicInstrumentsCategory.count', -1) do
      delete music_instruments_category_url(@music_instruments_category)
    end

    assert_redirected_to music_instruments_categories_url
  end
end
