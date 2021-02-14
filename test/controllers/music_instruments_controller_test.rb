require 'test_helper'

class MusicInstrumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @music_instrument = music_instruments(:one)
  end

  test "should get index" do
    get music_instruments_url
    assert_response :success
  end

  test "should get new" do
    get new_music_instrument_url
    assert_response :success
  end

  test "should create music_instrument" do
    assert_difference('MusicInstrument.count') do
      post music_instruments_url, params: { music_instrument: { item_description: @music_instrument.item_description, item_tittle: @music_instrument.item_tittle, phone_number: @music_instrument.phone_number, price: @music_instrument.price, user_name: @music_instrument.user_name } }
    end

    assert_redirected_to music_instrument_url(MusicInstrument.last)
  end

  test "should show music_instrument" do
    get music_instrument_url(@music_instrument)
    assert_response :success
  end

  test "should get edit" do
    get edit_music_instrument_url(@music_instrument)
    assert_response :success
  end

  test "should update music_instrument" do
    patch music_instrument_url(@music_instrument), params: { music_instrument: { item_description: @music_instrument.item_description, item_tittle: @music_instrument.item_tittle, phone_number: @music_instrument.phone_number, price: @music_instrument.price, user_name: @music_instrument.user_name } }
    assert_redirected_to music_instrument_url(@music_instrument)
  end

  test "should destroy music_instrument" do
    assert_difference('MusicInstrument.count', -1) do
      delete music_instrument_url(@music_instrument)
    end

    assert_redirected_to music_instruments_url
  end
end
