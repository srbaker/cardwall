require "test_helper"

class CardColumnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_column = card_columns(:one)
  end

  test "should get index" do
    get card_columns_url
    assert_response :success
  end

  test "should get new" do
    get new_card_column_url
    assert_response :success
  end

  test "should create card_column" do
    assert_difference("CardColumn.count") do
      post card_columns_url, params: { card_column: { title: @card_column.title } }
    end

    assert_redirected_to card_column_url(CardColumn.last)
  end

  test "should show card_column" do
    get card_column_url(@card_column)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_column_url(@card_column)
    assert_response :success
  end

  test "should update card_column" do
    patch card_column_url(@card_column), params: { card_column: { title: @card_column.title } }
    assert_redirected_to card_column_url(@card_column)
  end

  test "should destroy card_column" do
    assert_difference("CardColumn.count", -1) do
      delete card_column_url(@card_column)
    end

    assert_redirected_to card_columns_url
  end
end
