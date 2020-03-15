require 'test_helper'

class PlasmidBatchQcAttachementsControllerTest < ActionController::TestCase
  setup do
    @plasmid_batch_qc_attachement = plasmid_batch_qc_attachements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plasmid_batch_qc_attachements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plasmid_batch_qc_attachement" do
    assert_difference('PlasmidBatchQcAttachement.count') do
      post :create, plasmid_batch_qc_attachement: {  }
    end

    assert_redirected_to plasmid_batch_qc_attachement_path(assigns(:plasmid_batch_qc_attachement))
  end

  test "should show plasmid_batch_qc_attachement" do
    get :show, id: @plasmid_batch_qc_attachement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plasmid_batch_qc_attachement
    assert_response :success
  end

  test "should update plasmid_batch_qc_attachement" do
    patch :update, id: @plasmid_batch_qc_attachement, plasmid_batch_qc_attachement: {  }
    assert_redirected_to plasmid_batch_qc_attachement_path(assigns(:plasmid_batch_qc_attachement))
  end

  test "should destroy plasmid_batch_qc_attachement" do
    assert_difference('PlasmidBatchQcAttachement.count', -1) do
      delete :destroy, id: @plasmid_batch_qc_attachement
    end

    assert_redirected_to plasmid_batch_qc_attachements_path
  end
end
