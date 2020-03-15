require 'test_helper'

class ClonesControllerTest < ActionController::TestCase
  setup do
    @clone = clones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clone" do
    assert_difference('Clone.count') do
      post :create, clone: {  }
    end

    assert_redirected_to clone_path(assigns(:clone))
  end

  test "should show clone" do
    get :show, id: @clone
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clone
    assert_response :success
  end

  test "should update clone" do
    patch :update, id: @clone, clone: {  }
    assert_redirected_to clone_path(assigns(:clone))
  end

  test "should destroy clone" do
    assert_difference('Clone.count', -1) do
      delete :destroy, id: @clone
    end

    assert_redirected_to clones_path
  end
end
