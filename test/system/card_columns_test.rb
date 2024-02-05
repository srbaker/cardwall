require "application_system_test_case"

class CardColumnsTest < ApplicationSystemTestCase
  setup do
    @card_column = card_columns(:one)
  end

  test "visiting the index" do
    visit card_columns_url
    assert_selector "h1", text: "Card columns"
  end

  test "should create card column" do
    visit card_columns_url
    click_on "New card column"

    fill_in "Title", with: @card_column.title
    click_on "Create Card column"

    assert_text "Card column was successfully created"
    click_on "Back"
  end

  test "should update Card column" do
    visit card_column_url(@card_column)
    click_on "Edit this card column", match: :first

    fill_in "Title", with: @card_column.title
    click_on "Update Card column"

    assert_text "Card column was successfully updated"
    click_on "Back"
  end

  test "should destroy Card column" do
    visit card_column_url(@card_column)
    click_on "Destroy this card column", match: :first

    assert_text "Card column was successfully destroyed"
  end
end
