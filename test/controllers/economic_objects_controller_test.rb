require 'test_helper'

class EconomicObjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @economic_object = economic_objects(:one)
  end

  test "should get index" do
    get economic_objects_url
    assert_response :success
  end

  test "should get new" do
    get new_economic_object_url
    assert_response :success
  end

  test "should create economic_object" do
    assert_difference('EconomicObject.count') do
      post economic_objects_url, params: { economic_object: { costOfStorage: @economic_object.costOfStorage, funds: @economic_object.funds, production: @economic_object.production, supply: @economic_object.supply, type: @economic_object.type } }
    end

    assert_redirected_to economic_object_url(EconomicObject.last)
  end

  test "should show economic_object" do
    get economic_object_url(@economic_object)
    assert_response :success
  end

  test "should get edit" do
    get edit_economic_object_url(@economic_object)
    assert_response :success
  end

  test "should update economic_object" do
    patch economic_object_url(@economic_object), params: { economic_object: { costOfStorage: @economic_object.costOfStorage, funds: @economic_object.funds, production: @economic_object.production, supply: @economic_object.supply, type: @economic_object.type } }
    assert_redirected_to economic_object_url(@economic_object)
  end

  test "should destroy economic_object" do
    assert_difference('EconomicObject.count', -1) do
      delete economic_object_url(@economic_object)
    end

    assert_redirected_to economic_objects_url
  end
end
