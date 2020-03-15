require 'test_helper'

class PrimersControllerTest < ActionController::TestCase
  setup do
    @primer = primers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:primers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create primer" do
    assert_difference('Primer.count') do
      post :create, primer: {  }
    end

    assert_redirected_to primer_path(assigns(:primer))
  end

  test "should show primer" do
    get :show, id: @primer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @primer
    assert_response :success
  end

  test "should update primer" do
    patch :update, id: @primer, primer: {  }
    assert_redirected_to primer_path(assigns(:primer))
  end

  test "should destroy primer" do
    assert_difference('Primer.count', -1) do
      delete :destroy, id: @primer
    end

    assert_redirected_to primers_path
  end
end
