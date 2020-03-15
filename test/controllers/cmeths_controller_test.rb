require 'test_helper'

class CmethsControllerTest < ActionController::TestCase
  setup do
    @cmeth = cmeths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cmeths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cmeth" do
    assert_difference('Cmeth.count') do
      post :create, cmeth: {  }
    end

    assert_redirected_to cmeth_path(assigns(:cmeth))
  end

  test "should show cmeth" do
    get :show, id: @cmeth
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cmeth
    assert_response :success
  end

  test "should update cmeth" do
    patch :update, id: @cmeth, cmeth: {  }
    assert_redirected_to cmeth_path(assigns(:cmeth))
  end

  test "should destroy cmeth" do
    assert_difference('Cmeth.count', -1) do
      delete :destroy, id: @cmeth
    end

    assert_redirected_to cmeths_path
  end
end
