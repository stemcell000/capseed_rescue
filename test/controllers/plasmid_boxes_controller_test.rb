require 'test_helper'

class PlasmidBoxesControllerTest < ActionController::TestCase
  setup do
    @plasmid_box = plasmid_boxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plasmid_boxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plasmid_box" do
    assert_difference('PlasmidBox.count') do
      post :create, plasmid_box: {  }
    end

    assert_redirected_to plasmid_box_path(assigns(:plasmid_box))
  end

  test "should show plasmid_box" do
    get :show, id: @plasmid_box
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plasmid_box
    assert_response :success
  end

  test "should update plasmid_box" do
    patch :update, id: @plasmid_box, plasmid_box: {  }
    assert_redirected_to plasmid_box_path(assigns(:plasmid_box))
  end

  test "should destroy plasmid_box" do
    assert_difference('PlasmidBox.count', -1) do
      delete :destroy, id: @plasmid_box
    end

    assert_redirected_to plasmid_boxes_path
  end
end
