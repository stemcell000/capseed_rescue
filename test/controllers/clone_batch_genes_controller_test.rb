require 'test_helper'

class CloneBatchGenesControllerTest < ActionController::TestCase
  setup do
    @clone_batch_gene = clone_batch_genes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clone_batch_genes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clone_batch_gene" do
    assert_difference('CloneBatchGene.count') do
      post :create, clone_batch_gene: {  }
    end

    assert_redirected_to clone_batch_gene_path(assigns(:clone_batch_gene))
  end

  test "should show clone_batch_gene" do
    get :show, id: @clone_batch_gene
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clone_batch_gene
    assert_response :success
  end

  test "should update clone_batch_gene" do
    patch :update, id: @clone_batch_gene, clone_batch_gene: {  }
    assert_redirected_to clone_batch_gene_path(assigns(:clone_batch_gene))
  end

  test "should destroy clone_batch_gene" do
    assert_difference('CloneBatchGene.count', -1) do
      delete :destroy, id: @clone_batch_gene
    end

    assert_redirected_to clone_batch_genes_path
  end
end
