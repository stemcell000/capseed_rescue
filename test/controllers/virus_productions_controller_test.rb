require 'test_helper'

class VirusProductionsControllerTest < ActionController::TestCase
  setup do
    @virus_production = virus_productions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:virus_productions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create virus_production" do
    assert_difference('VirusProduction.count') do
      post :create, virus_production: {  }
    end

    assert_redirected_to virus_production_path(assigns(:virus_production))
  end

  test "should show virus_production" do
    get :show, id: @virus_production
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @virus_production
    assert_response :success
  end

  test "should update virus_production" do
    patch :update, id: @virus_production, virus_production: {  }
    assert_redirected_to virus_production_path(assigns(:virus_production))
  end

  test "should destroy virus_production" do
    assert_difference('VirusProduction.count', -1) do
      delete :destroy, id: @virus_production
    end

    assert_redirected_to virus_productions_path
  end
end
