require "test_helper"

class CardTest < ActiveSupport::TestCase
  test "belongs to lane" do
    lane = lanes(:one)

    card = Card.new lane: lane

    assert card.valid?
  end

  test "must belong to lane" do
    card = Card.new lane_id: nil

    assert card.invalid?
    assert card.errors.has_key? :lane
    assert_equal ["must exist"], card.errors[:lane]
  end
end
