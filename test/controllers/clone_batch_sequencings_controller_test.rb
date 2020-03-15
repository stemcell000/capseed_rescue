require 'test_helper'

class CloneBatchSequencingsControllerTest < ActionController::TestCase
  setup do
    @clone_batch_sequencing = clone_batch_sequencings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clone_batch_sequencings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clone_batch_sequencing" do
    assert_difference('CloneBatchSequencing.count') do
      post :create, clone_batch_sequencing: {  }
    end

    assert_redirected_to clone_batch_sequencing_path(assigns(:clone_batch_sequencing))
  end

  test "should show clone_batch_sequencing" do
    get :show, id: @clone_batch_sequencing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clone_batch_sequencing
    assert_response :success
  end

  test "should update clone_batch_sequencing" do
    patch :update, id: @clone_batch_sequencing, clone_batch_sequencing: {  }
    assert_redirected_to clone_batch_sequencing_path(assigns(:clone_batch_sequencing))
  end

  test "should destroy clone_batch_sequencing" do
    assert_difference('CloneBatchSequencing.count', -1) do
      delete :destroy, id: @clone_batch_sequencing
    end

    assert_redirected_to clone_batch_sequencings_path
  end
end
