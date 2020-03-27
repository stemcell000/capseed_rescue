require 'test_helper'

class BoxFormatsControllerTest < ActionController::TestCase
  setup do
    @box_format = box_formats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:box_formats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create box_format" do
    assert_difference('BoxFormat.count') do
      post :create, box_format: {  }
    end

    assert_redirected_to box_format_path(assigns(:box_format))
  end

  test "should show box_format" do
    get :show, id: @box_format
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @box_format
    assert_response :success
  end

  test "should update box_format" do
    patch :update, id: @box_format, box_format: {  }
    assert_redirected_to box_format_path(assigns(:box_format))
  end

  test "should destroy box_format" do
    assert_difference('BoxFormat.count', -1) do
      delete :destroy, id: @box_format
    end

    assert_redirected_to box_formats_path
  end
end
