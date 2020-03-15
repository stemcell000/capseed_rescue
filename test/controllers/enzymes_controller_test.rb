require 'test_helper'

class EnzymesControllerTest < ActionController::TestCase
  setup do
    @enzyme = enzymes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enzymes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create enzyme" do
    assert_difference('Enzyme.count') do
      post :create, enzyme: {  }
    end

    assert_redirected_to enzyme_path(assigns(:enzyme))
  end

  test "should show enzyme" do
    get :show, id: @enzyme
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @enzyme
    assert_response :success
  end

  test "should update enzyme" do
    patch :update, id: @enzyme, enzyme: {  }
    assert_redirected_to enzyme_path(assigns(:enzyme))
  end

  test "should destroy enzyme" do
    assert_difference('Enzyme.count', -1) do
      delete :destroy, id: @enzyme
    end

    assert_redirected_to enzymes_path
  end
end
