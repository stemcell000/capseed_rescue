require 'test_helper'

class CloneEnzymesControllerTest < ActionController::TestCase
  setup do
    @clone_enzyme = clone_enzymes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clone_enzymes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clone_enzyme" do
    assert_difference('CloneEnzyme.count') do
      post :create, clone_enzyme: {  }
    end

    assert_redirected_to clone_enzyme_path(assigns(:clone_enzyme))
  end

  test "should show clone_enzyme" do
    get :show, id: @clone_enzyme
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clone_enzyme
    assert_response :success
  end

  test "should update clone_enzyme" do
    patch :update, id: @clone_enzyme, clone_enzyme: {  }
    assert_redirected_to clone_enzyme_path(assigns(:clone_enzyme))
  end

  test "should destroy clone_enzyme" do
    assert_difference('CloneEnzyme.count', -1) do
      delete :destroy, id: @clone_enzyme
    end

    assert_redirected_to clone_enzymes_path
  end
end
