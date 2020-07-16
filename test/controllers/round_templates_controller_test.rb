require 'test_helper'

class RoundTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @round_template = round_templates(:one)
  end

  test "should get index" do
    get round_templates_url, as: :json
    assert_response :success
  end

  test "should create round_template" do
    assert_difference('RoundTemplate.count') do
      post round_templates_url, params: { round_template: { block_template_id: @round_template.block_template_id, percent: @round_template.percent, reps: @round_template.reps, sets: @round_template.sets, weight: @round_template.weight } }, as: :json
    end

    assert_response 201
  end

  test "should show round_template" do
    get round_template_url(@round_template), as: :json
    assert_response :success
  end

  test "should update round_template" do
    patch round_template_url(@round_template), params: { round_template: { block_template_id: @round_template.block_template_id, percent: @round_template.percent, reps: @round_template.reps, sets: @round_template.sets, weight: @round_template.weight } }, as: :json
    assert_response 200
  end

  test "should destroy round_template" do
    assert_difference('RoundTemplate.count', -1) do
      delete round_template_url(@round_template), as: :json
    end

    assert_response 204
  end
end
