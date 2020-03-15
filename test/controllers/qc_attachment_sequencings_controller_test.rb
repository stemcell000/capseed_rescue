require 'test_helper'

class QcAttachmentSequencingsControllerTest < ActionController::TestCase
  setup do
    @qc_attachment_sequencing = qc_attachment_sequencings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qc_attachment_sequencings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qc_attachment_sequencing" do
    assert_difference('QcAttachmentSequencing.count') do
      post :create, qc_attachment_sequencing: {  }
    end

    assert_redirected_to qc_attachment_sequencing_path(assigns(:qc_attachment_sequencing))
  end

  test "should show qc_attachment_sequencing" do
    get :show, id: @qc_attachment_sequencing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @qc_attachment_sequencing
    assert_response :success
  end

  test "should update qc_attachment_sequencing" do
    patch :update, id: @qc_attachment_sequencing, qc_attachment_sequencing: {  }
    assert_redirected_to qc_attachment_sequencing_path(assigns(:qc_attachment_sequencing))
  end

  test "should destroy qc_attachment_sequencing" do
    assert_difference('QcAttachmentSequencing.count', -1) do
      delete :destroy, id: @qc_attachment_sequencing
    end

    assert_redirected_to qc_attachment_sequencings_path
  end
end
