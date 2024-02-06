require "test_helper"

class CardColumnTest < ActiveSupport::TestCase
  test "requires a title" do
    card_column = CardColumn.new title: ''

    assert card_column.invalid?
    assert card_column.errors.has_key? :title
    assert_equal ["can't be blank"], card_column.errors[:title]
  end
end
