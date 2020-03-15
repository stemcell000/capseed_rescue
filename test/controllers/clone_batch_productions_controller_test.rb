require 'test_helper'

class CloneBatchProductionsControllerTest < ActionController::TestCase
  setup do
    @clone_batch_production = clone_batch_productions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clone_batch_productions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clone_batch_production" do
    assert_difference('CloneBatchProduction.count') do
      post :create, clone_batch_production: {  }
    end

    assert_redirected_to clone_batch_production_path(assigns(:clone_batch_production))
  end

  test "should show clone_batch_production" do
    get :show, id: @clone_batch_production
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clone_batch_production
    assert_response :success
  end

  test "should update clone_batch_production" do
    patch :update, id: @clone_batch_production, clone_batch_production: {  }
    assert_redirected_to clone_batch_production_path(assigns(:clone_batch_production))
  end

  test "should destroy clone_batch_production" do
    assert_difference('CloneBatchProduction.count', -1) do
      delete :destroy, id: @clone_batch_production
    end

    assert_redirected_to clone_batch_productions_path
  end
end
