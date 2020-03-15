require 'test_helper'

class PcrColonyQcAttachmentsControllerTest < ActionController::TestCase
  setup do
    @pcr_colony_qc_attachment = pcr_colony_qc_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pcr_colony_qc_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pcr_colony_qc_attachment" do
    assert_difference('PcrColonyQcAttachment.count') do
      post :create, pcr_colony_qc_attachment: {  }
    end

    assert_redirected_to pcr_colony_qc_attachment_path(assigns(:pcr_colony_qc_attachment))
  end

  test "should show pcr_colony_qc_attachment" do
    get :show, id: @pcr_colony_qc_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pcr_colony_qc_attachment
    assert_response :success
  end

  test "should update pcr_colony_qc_attachment" do
    patch :update, id: @pcr_colony_qc_attachment, pcr_colony_qc_attachment: {  }
    assert_redirected_to pcr_colony_qc_attachment_path(assigns(:pcr_colony_qc_attachment))
  end

  test "should destroy pcr_colony_qc_attachment" do
    assert_difference('PcrColonyQcAttachment.count', -1) do
      delete :destroy, id: @pcr_colony_qc_attachment
    end

    assert_redirected_to pcr_colony_qc_attachments_path
  end
end
