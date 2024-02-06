require "test_helper"

class CardColumnTest < ActiveSupport::TestCase
  test "belongs to project" do
    project = projects(:one)

    card_column = CardColumn.new project: project, title: 'To Do'

    assert card_column.valid?
  end

  test "must belong to project" do
    card_column = CardColumn.new project: nil

    assert card_column.invalid?
    assert card_column.errors.has_key? :project
    assert_equal ["must exist"], card_column.errors[:project]
  end

  test "deleting a card_column deletes all of its cards" do
    card_column = card_columns(:one)
    card_column.cards.create title: 'Foo'
    card_column.cards.create title: 'Bar'

    assert 2, card_column.cards.count

    card_column.destroy

    assert 0, CardColumn.count
    assert 0, Card.count
  end
end
