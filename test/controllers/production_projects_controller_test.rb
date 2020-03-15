require 'test_helper'

class ProductionProjectsControllerTest < ActionController::TestCase
  setup do
    @production_project = production_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:production_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create production_project" do
    assert_difference('ProductionProject.count') do
      post :create, production_project: {  }
    end

    assert_redirected_to production_project_path(assigns(:production_project))
  end

  test "should show production_project" do
    get :show, id: @production_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @production_project
    assert_response :success
  end

  test "should update production_project" do
    patch :update, id: @production_project, production_project: {  }
    assert_redirected_to production_project_path(assigns(:production_project))
  end

  test "should destroy production_project" do
    assert_difference('ProductionProject.count', -1) do
      delete :destroy, id: @production_project
    end

    assert_redirected_to production_projects_path
  end
end
