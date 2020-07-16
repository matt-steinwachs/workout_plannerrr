require 'test_helper'

class BlockTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @block_template = block_templates(:one)
  end

  test "should get index" do
    get block_templates_url, as: :json
    assert_response :success
  end

  test "should create block_template" do
    assert_difference('BlockTemplate.count') do
      post block_templates_url, params: { block_template: { exercise_id: @block_template.exercise_id, workout_template_id: @block_template.workout_template_id } }, as: :json
    end

    assert_response 201
  end

  test "should show block_template" do
    get block_template_url(@block_template), as: :json
    assert_response :success
  end

  test "should update block_template" do
    patch block_template_url(@block_template), params: { block_template: { exercise_id: @block_template.exercise_id, workout_template_id: @block_template.workout_template_id } }, as: :json
    assert_response 200
  end

  test "should destroy block_template" do
    assert_difference('BlockTemplate.count', -1) do
      delete block_template_url(@block_template), as: :json
    end

    assert_response 204
  end
end
