require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  test "deleting a project deletes all of its lanes" do
    project = projects(:one)
    project.lanes.create title: 'A Lane'
    project.lanes.create title: 'Another Lane'

    assert 2, project.lanes.count

    project.destroy

    assert 0, Project.count
    assert 0, Lane.count
  end
end
