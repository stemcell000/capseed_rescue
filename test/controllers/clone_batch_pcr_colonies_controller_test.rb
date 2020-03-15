require 'test_helper'

class CloneBatchPcrColoniesControllerTest < ActionController::TestCase
  setup do
    @clone_batch_pcr_colony = clone_batch_pcr_colonies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clone_batch_pcr_colonies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clone_batch_pcr_colony" do
    assert_difference('CloneBatchPcrColony.count') do
      post :create, clone_batch_pcr_colony: {  }
    end

    assert_redirected_to clone_batch_pcr_colony_path(assigns(:clone_batch_pcr_colony))
  end

  test "should show clone_batch_pcr_colony" do
    get :show, id: @clone_batch_pcr_colony
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clone_batch_pcr_colony
    assert_response :success
  end

  test "should update clone_batch_pcr_colony" do
    patch :update, id: @clone_batch_pcr_colony, clone_batch_pcr_colony: {  }
    assert_redirected_to clone_batch_pcr_colony_path(assigns(:clone_batch_pcr_colony))
  end

  test "should destroy clone_batch_pcr_colony" do
    assert_difference('CloneBatchPcrColony.count', -1) do
      delete :destroy, id: @clone_batch_pcr_colony
    end

    assert_redirected_to clone_batch_pcr_colonies_path
  end
end
