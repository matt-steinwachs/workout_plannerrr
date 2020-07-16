require 'test_helper'

class CycleTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cycle_template = cycle_templates(:one)
  end

  test "should get index" do
    get cycle_templates_url, as: :json
    assert_response :success
  end

  test "should create cycle_template" do
    assert_difference('CycleTemplate.count') do
      post cycle_templates_url, params: { cycle_template: { name: @cycle_template.name } }, as: :json
    end

    assert_response 201
  end

  test "should show cycle_template" do
    get cycle_template_url(@cycle_template), as: :json
    assert_response :success
  end

  test "should update cycle_template" do
    patch cycle_template_url(@cycle_template), params: { cycle_template: { name: @cycle_template.name } }, as: :json
    assert_response 200
  end

  test "should destroy cycle_template" do
    assert_difference('CycleTemplate.count', -1) do
      delete cycle_template_url(@cycle_template), as: :json
    end

    assert_response 204
  end
end
