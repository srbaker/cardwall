require "test_helper"

class LanesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lane = lanes(:one)
  end

  test "should get new" do
    get new_lane_url
    assert_response :success
  end

  test "should create lane" do
    assert_difference("Lane.count") do
      post lanes_url, params: { lane: { project_id: projects(:one).id, title: @lane.title } }
    end

    assert_redirected_to @lane.project
  end

  test "should show lane" do
    get lane_url(@lane)
    assert_response :success
  end

  test "should get edit" do
    get edit_lane_url(@lane)
    assert_response :success
  end

  test "should update lane" do
    patch lane_url(@lane), params: { lane: { title: @lane.title } }
    assert_response :ok
  end

  test "should destroy lane" do
    assert_difference("Lane.count", -1) do
      delete lane_url(@lane)
    end

    assert_redirected_to @lane.project
  end
end
