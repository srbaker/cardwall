require "application_system_test_case"

class LanesTest < ApplicationSystemTestCase
  setup do
    @lane = lanes(:one)
  end

  test "visiting the index" do
    visit lanes_url
    assert_selector "h1", text: "Lanes"
  end

  test "should create lane" do
    visit lanes_url
    click_on "New lane"

    fill_in "Title", with: @lane.title
    click_on "Create Lane"

    assert_text "Lane was successfully created"
    click_on "Back"
  end

  test "should update Lane" do
    visit lane_url(@lane)
    click_on "Edit this lane", match: :first

    fill_in "Title", with: @lane.title
    click_on "Update Lane"

    assert_text "Lane was successfully updated"
    click_on "Back"
  end

  test "should destroy Lane" do
    visit lane_url(@lane)
    click_on "Destroy this lane", match: :first

    assert_text "Lane was successfully destroyed"
  end
end
