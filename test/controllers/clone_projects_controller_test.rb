require 'test_helper'

class CloneProjectsControllerTest < ActionController::TestCase
  setup do
    @clone_project = clone_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clone_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clone_project" do
    assert_difference('CloneProject.count') do
      post :create, clone_project: {  }
    end

    assert_redirected_to clone_project_path(assigns(:clone_project))
  end

  test "should show clone_project" do
    get :show, id: @clone_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clone_project
    assert_response :success
  end

  test "should update clone_project" do
    patch :update, id: @clone_project, clone_project: {  }
    assert_redirected_to clone_project_path(assigns(:clone_project))
  end

  test "should destroy clone_project" do
    assert_difference('CloneProject.count', -1) do
      delete :destroy, id: @clone_project
    end

    assert_redirected_to clone_projects_path
  end
end
