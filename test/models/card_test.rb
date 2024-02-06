require "test_helper"

class CardTest < ActiveSupport::TestCase
  test "belongs to card_column" do
    card_column = card_columns(:one)

    card = Card.new card_column: card_column

    assert card.valid?
  end

  test "must belong to card_column" do
    card = Card.new card_column_id: nil

    assert card.invalid?
    assert card.errors.has_key? :card_column
    assert_equal ["must exist"], card.errors[:card_column]
  end
end
