require 'test_helper'

class DosagesControllerTest < ActionController::TestCase
  setup do
    @dosage = dosages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dosages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dosage" do
    assert_difference('Dosage.count') do
      post :create, dosage: {  }
    end

    assert_redirected_to dosage_path(assigns(:dosage))
  end

  test "should show dosage" do
    get :show, id: @dosage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dosage
    assert_response :success
  end

  test "should update dosage" do
    patch :update, id: @dosage, dosage: {  }
    assert_redirected_to dosage_path(assigns(:dosage))
  end

  test "should destroy dosage" do
    assert_difference('Dosage.count', -1) do
      delete :destroy, id: @dosage
    end

    assert_redirected_to dosages_path
  end
end
