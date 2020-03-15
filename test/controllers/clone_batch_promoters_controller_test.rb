require 'test_helper'

class CloneBatchPromotersControllerTest < ActionController::TestCase
  setup do
    @clone_batch_promoter = clone_batch_promoters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clone_batch_promoters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clone_batch_promoter" do
    assert_difference('CloneBatchPromoter.count') do
      post :create, clone_batch_promoter: {  }
    end

    assert_redirected_to clone_batch_promoter_path(assigns(:clone_batch_promoter))
  end

  test "should show clone_batch_promoter" do
    get :show, id: @clone_batch_promoter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clone_batch_promoter
    assert_response :success
  end

  test "should update clone_batch_promoter" do
    patch :update, id: @clone_batch_promoter, clone_batch_promoter: {  }
    assert_redirected_to clone_batch_promoter_path(assigns(:clone_batch_promoter))
  end

  test "should destroy clone_batch_promoter" do
    assert_difference('CloneBatchPromoter.count', -1) do
      delete :destroy, id: @clone_batch_promoter
    end

    assert_redirected_to clone_batch_promoters_path
  end
end
