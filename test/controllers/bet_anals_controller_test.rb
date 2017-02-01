require 'test_helper'

class BetAnalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bet_anal = bet_anals(:one)
  end

  test "should get index" do
    get bet_anals_url
    assert_response :success
  end

  test "should get new" do
    get new_bet_anal_url
    assert_response :success
  end

  test "should create bet_anal" do
    assert_difference('BetAnal.count') do
      post bet_anals_url, params: { bet_anal: { measuredTime: @bet_anal.measuredTime, undrawnBallCount: @bet_anal.undrawnBallCount, undrawnCycleCount: @bet_anal.undrawnCycleCount } }
    end

    assert_redirected_to bet_anal_url(BetAnal.last)
  end

  test "should show bet_anal" do
    get bet_anal_url(@bet_anal)
    assert_response :success
  end

  test "should get edit" do
    get edit_bet_anal_url(@bet_anal)
    assert_response :success
  end

  test "should update bet_anal" do
    patch bet_anal_url(@bet_anal), params: { bet_anal: { measuredTime: @bet_anal.measuredTime, undrawnBallCount: @bet_anal.undrawnBallCount, undrawnCycleCount: @bet_anal.undrawnCycleCount } }
    assert_redirected_to bet_anal_url(@bet_anal)
  end

  test "should destroy bet_anal" do
    assert_difference('BetAnal.count', -1) do
      delete bet_anal_url(@bet_anal)
    end

    assert_redirected_to bet_anals_url
  end
end
