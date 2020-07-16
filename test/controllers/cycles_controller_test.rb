require 'test_helper'

class CyclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cycle = cycles(:one)
  end

  test "should get index" do
    get cycles_url, as: :json
    assert_response :success
  end

  test "should create cycle" do
    assert_difference('Cycle.count') do
      post cycles_url, params: { cycle: { cycle_template_id: @cycle.cycle_template_id, end: @cycle.end, name: @cycle.name, start: @cycle.start } }, as: :json
    end

    assert_response 201
  end

  test "should show cycle" do
    get cycle_url(@cycle), as: :json
    assert_response :success
  end

  test "should update cycle" do
    patch cycle_url(@cycle), params: { cycle: { cycle_template_id: @cycle.cycle_template_id, end: @cycle.end, name: @cycle.name, start: @cycle.start } }, as: :json
    assert_response 200
  end

  test "should destroy cycle" do
    assert_difference('Cycle.count', -1) do
      delete cycle_url(@cycle), as: :json
    end

    assert_response 204
  end
end
