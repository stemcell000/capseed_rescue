require 'test_helper'

class AssayProjectsControllerTest < ActionController::TestCase
  setup do
    @assay_project = assay_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assay_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assay_project" do
    assert_difference('AssayProject.count') do
      post :create, assay_project: {  }
    end

    assert_redirected_to assay_project_path(assigns(:assay_project))
  end

  test "should show assay_project" do
    get :show, id: @assay_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assay_project
    assert_response :success
  end

  test "should update assay_project" do
    patch :update, id: @assay_project, assay_project: {  }
    assert_redirected_to assay_project_path(assigns(:assay_project))
  end

  test "should destroy assay_project" do
    assert_difference('AssayProject.count', -1) do
      delete :destroy, id: @assay_project
    end

    assert_redirected_to assay_projects_path
  end
end
