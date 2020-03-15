require 'test_helper'

class CloneBatchUsersControllerTest < ActionController::TestCase
  setup do
    @clone_batch_user = clone_batch_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clone_batch_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clone_batch_user" do
    assert_difference('CloneBatchUser.count') do
      post :create, clone_batch_user: {  }
    end

    assert_redirected_to clone_batch_user_path(assigns(:clone_batch_user))
  end

  test "should show clone_batch_user" do
    get :show, id: @clone_batch_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clone_batch_user
    assert_response :success
  end

  test "should update clone_batch_user" do
    patch :update, id: @clone_batch_user, clone_batch_user: {  }
    assert_redirected_to clone_batch_user_path(assigns(:clone_batch_user))
  end

  test "should destroy clone_batch_user" do
    assert_difference('CloneBatchUser.count', -1) do
      delete :destroy, id: @clone_batch_user
    end

    assert_redirected_to clone_batch_users_path
  end
end
