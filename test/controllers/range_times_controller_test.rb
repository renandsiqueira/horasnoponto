require 'test_helper'

class RangeTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @range_time = range_times(:one)
  end

  test "should get index" do
    get range_times_url
    assert_response :success
  end

  test "should get new" do
    get new_range_time_url
    assert_response :success
  end

  test "should create range_time" do
    assert_difference('RangeTime.count') do
      post range_times_url, params: { range_time: { date: @range_time.date, difference_hours: @range_time.difference_hours, difference_seconds: @range_time.difference_seconds, end_time: @range_time.end_time, start_time: @range_time.start_time, user_id: @range_time.user_id } }
    end

    assert_redirected_to range_time_url(RangeTime.last)
  end

  test "should show range_time" do
    get range_time_url(@range_time)
    assert_response :success
  end

  test "should get edit" do
    get edit_range_time_url(@range_time)
    assert_response :success
  end

  test "should update range_time" do
    patch range_time_url(@range_time), params: { range_time: { date: @range_time.date, difference_hours: @range_time.difference_hours, difference_seconds: @range_time.difference_seconds, end_time: @range_time.end_time, start_time: @range_time.start_time, user_id: @range_time.user_id } }
    assert_redirected_to range_time_url(@range_time)
  end

  test "should destroy range_time" do
    assert_difference('RangeTime.count', -1) do
      delete range_time_url(@range_time)
    end

    assert_redirected_to range_times_url
  end
end
