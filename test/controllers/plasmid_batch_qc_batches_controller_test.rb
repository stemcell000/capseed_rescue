require 'test_helper'

class PlasmidBatchQcBatchesControllerTest < ActionController::TestCase
  setup do
    @plasmid_batch_qc_batch = plasmid_batch_qc_batches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plasmid_batch_qc_batches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plasmid_batch_qc_batch" do
    assert_difference('PlasmidBatchQcBatch.count') do
      post :create, plasmid_batch_qc_batch: {  }
    end

    assert_redirected_to plasmid_batch_qc_batch_path(assigns(:plasmid_batch_qc_batch))
  end

  test "should show plasmid_batch_qc_batch" do
    get :show, id: @plasmid_batch_qc_batch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plasmid_batch_qc_batch
    assert_response :success
  end

  test "should update plasmid_batch_qc_batch" do
    patch :update, id: @plasmid_batch_qc_batch, plasmid_batch_qc_batch: {  }
    assert_redirected_to plasmid_batch_qc_batch_path(assigns(:plasmid_batch_qc_batch))
  end

  test "should destroy plasmid_batch_qc_batch" do
    assert_difference('PlasmidBatchQcBatch.count', -1) do
      delete :destroy, id: @plasmid_batch_qc_batch
    end

    assert_redirected_to plasmid_batch_qc_batches_path
  end
end
