require 'test_helper'

class OptionVirusProductionsControllerTest < ActionController::TestCase
  setup do
    @option_virus_production = option_virus_productions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:option_virus_productions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create option_virus_production" do
    assert_difference('OptionVirusProduction.count') do
      post :create, option_virus_production: {  }
    end

    assert_redirected_to option_virus_production_path(assigns(:option_virus_production))
  end

  test "should show option_virus_production" do
    get :show, id: @option_virus_production
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @option_virus_production
    assert_response :success
  end

  test "should update option_virus_production" do
    patch :update, id: @option_virus_production, option_virus_production: {  }
    assert_redirected_to option_virus_production_path(assigns(:option_virus_production))
  end

  test "should destroy option_virus_production" do
    assert_difference('OptionVirusProduction.count', -1) do
      delete :destroy, id: @option_virus_production
    end

    assert_redirected_to option_virus_productions_path
  end
end
