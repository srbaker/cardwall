require "test_helper"

class LaneTest < ActiveSupport::TestCase
  test "belongs to project" do
    project = projects(:one)

    lane = Lane.new project: project, title: 'To Do'

    assert lane.valid?
  end

  test "must belong to project" do
    lane = Lane.new project: nil

    assert lane.invalid?
    assert lane.errors.has_key? :project
    assert_equal ["must exist"], lane.errors[:project]
  end

  test "deleting a lane deletes all of its cards" do
    lane = lanes(:one)
    lane.cards.create title: 'Foo'
    lane.cards.create title: 'Bar'

    assert 2, lane.cards.count

    lane.destroy

    assert 0, Lane.count
    assert 0, Card.count
  end
end
