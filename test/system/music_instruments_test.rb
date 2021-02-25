# frozen_string_literal: true

require 'application_system_test_case'

class MusicInstrumentsTest < ApplicationSystemTestCase
  setup do
    @music_instrument = music_instruments(:one)
  end

  test 'visiting the index' do
    visit music_instruments_url
    assert_selector 'h1', text: 'Music Instruments'
  end

  test 'creating a Music instrument' do
    visit music_instruments_url
    click_on 'New Music Instrument'

    fill_in 'Item description', with: @music_instrument.item_description
    fill_in 'Item tittle', with: @music_instrument.item_tittle
    fill_in 'Phone number', with: @music_instrument.phone_number
    fill_in 'Price', with: @music_instrument.price
    fill_in 'User name', with: @music_instrument.user_name
    click_on 'Create Music instrument'

    assert_text 'Music instrument was successfully created'
    click_on 'Back'
  end

  test 'updating a Music instrument' do
    visit music_instruments_url
    click_on 'Edit', match: :first

    fill_in 'Item description', with: @music_instrument.item_description
    fill_in 'Item tittle', with: @music_instrument.item_tittle
    fill_in 'Phone number', with: @music_instrument.phone_number
    fill_in 'Price', with: @music_instrument.price
    fill_in 'User name', with: @music_instrument.user_name
    click_on 'Update Music instrument'

    assert_text 'Music instrument was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Music instrument' do
    visit music_instruments_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Music instrument was successfully destroyed'
  end
end
