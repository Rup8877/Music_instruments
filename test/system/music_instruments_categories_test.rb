require "application_system_test_case"

class MusicInstrumentsCategoriesTest < ApplicationSystemTestCase
  setup do
    @music_instruments_category = music_instruments_categories(:one)
  end

  test "visiting the index" do
    visit music_instruments_categories_url
    assert_selector "h1", text: "Music Instruments Categories"
  end

  test "creating a Music instruments category" do
    visit music_instruments_categories_url
    click_on "New Music Instruments Category"

    fill_in "Name", with: @music_instruments_category.name
    click_on "Create Music instruments category"

    assert_text "Music instruments category was successfully created"
    click_on "Back"
  end

  test "updating a Music instruments category" do
    visit music_instruments_categories_url
    click_on "Edit", match: :first

    fill_in "Name", with: @music_instruments_category.name
    click_on "Update Music instruments category"

    assert_text "Music instruments category was successfully updated"
    click_on "Back"
  end

  test "destroying a Music instruments category" do
    visit music_instruments_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Music instruments category was successfully destroyed"
  end
end
