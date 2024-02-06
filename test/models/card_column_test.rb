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
end
