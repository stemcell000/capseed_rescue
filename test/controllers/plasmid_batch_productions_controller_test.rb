require 'test_helper'

class PlasmidBatchProductionsControllerTest < ActionController::TestCase
  setup do
    @plasmid_batch_production = plasmid_batch_productions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plasmid_batch_productions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plasmid_batch_production" do
    assert_difference('PlasmidBatchProduction.count') do
      post :create, plasmid_batch_production: {  }
    end

    assert_redirected_to plasmid_batch_production_path(assigns(:plasmid_batch_production))
  end

  test "should show plasmid_batch_production" do
    get :show, id: @plasmid_batch_production
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plasmid_batch_production
    assert_response :success
  end

  test "should update plasmid_batch_production" do
    patch :update, id: @plasmid_batch_production, plasmid_batch_production: {  }
    assert_redirected_to plasmid_batch_production_path(assigns(:plasmid_batch_production))
  end

  test "should destroy plasmid_batch_production" do
    assert_difference('PlasmidBatchProduction.count', -1) do
      delete :destroy, id: @plasmid_batch_production
    end

    assert_redirected_to plasmid_batch_productions_path
  end
end
