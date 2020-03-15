require 'test_helper'

class PcrColoniesControllerTest < ActionController::TestCase
  setup do
    @pcr_colony = pcr_colonies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pcr_colonies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pcr_colony" do
    assert_difference('PcrColony.count') do
      post :create, pcr_colony: {  }
    end

    assert_redirected_to pcr_colony_path(assigns(:pcr_colony))
  end

  test "should show pcr_colony" do
    get :show, id: @pcr_colony
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pcr_colony
    assert_response :success
  end

  test "should update pcr_colony" do
    patch :update, id: @pcr_colony, pcr_colony: {  }
    assert_redirected_to pcr_colony_path(assigns(:pcr_colony))
  end

  test "should destroy pcr_colony" do
    assert_difference('PcrColony.count', -1) do
      delete :destroy, id: @pcr_colony
    end

    assert_redirected_to pcr_colonies_path
  end
end
