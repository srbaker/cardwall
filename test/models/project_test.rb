require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  test "deleting a project deletes all of its card columns" do
    project = projects(:one)
    project.card_columns.create title: 'A Column'
    project.card_columns.create title: 'Another Column'

    assert 2, project.card_columns.count

    project.destroy

    assert 0, Project.count
    assert 0, CardColumn.count
  end
end
