require 'test_helper'

class SequencingsControllerTest < ActionController::TestCase
  setup do
    @sequencing = sequencings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sequencings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sequencing" do
    assert_difference('Sequencing.count') do
      post :create, sequencing: {  }
    end

    assert_redirected_to sequencing_path(assigns(:sequencing))
  end

  test "should show sequencing" do
    get :show, id: @sequencing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sequencing
    assert_response :success
  end

  test "should update sequencing" do
    patch :update, id: @sequencing, sequencing: {  }
    assert_redirected_to sequencing_path(assigns(:sequencing))
  end

  test "should destroy sequencing" do
    assert_difference('Sequencing.count', -1) do
      delete :destroy, id: @sequencing
    end

    assert_redirected_to sequencings_path
  end
end
