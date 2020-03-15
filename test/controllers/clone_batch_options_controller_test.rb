require 'test_helper'

class CloneBatchOptionsControllerTest < ActionController::TestCase
  setup do
    @clone_batch_option = clone_batch_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clone_batch_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clone_batch_option" do
    assert_difference('CloneBatchOption.count') do
      post :create, clone_batch_option: {  }
    end

    assert_redirected_to clone_batch_option_path(assigns(:clone_batch_option))
  end

  test "should show clone_batch_option" do
    get :show, id: @clone_batch_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clone_batch_option
    assert_response :success
  end

  test "should update clone_batch_option" do
    patch :update, id: @clone_batch_option, clone_batch_option: {  }
    assert_redirected_to clone_batch_option_path(assigns(:clone_batch_option))
  end

  test "should destroy clone_batch_option" do
    assert_difference('CloneBatchOption.count', -1) do
      delete :destroy, id: @clone_batch_option
    end

    assert_redirected_to clone_batch_options_path
  end
end
