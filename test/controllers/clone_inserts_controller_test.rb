require 'test_helper'

class CloneInsertsControllerTest < ActionController::TestCase
  setup do
    @clone_insert = clone_inserts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clone_inserts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clone_insert" do
    assert_difference('CloneInsert.count') do
      post :create, clone_insert: {  }
    end

    assert_redirected_to clone_insert_path(assigns(:clone_insert))
  end

  test "should show clone_insert" do
    get :show, id: @clone_insert
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clone_insert
    assert_response :success
  end

  test "should update clone_insert" do
    patch :update, id: @clone_insert, clone_insert: {  }
    assert_redirected_to clone_insert_path(assigns(:clone_insert))
  end

  test "should destroy clone_insert" do
    assert_difference('CloneInsert.count', -1) do
      delete :destroy, id: @clone_insert
    end

    assert_redirected_to clone_inserts_path
  end
end
