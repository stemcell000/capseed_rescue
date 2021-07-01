require 'test_helper'

class CloneSamplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clone_sample = clone_samples(:one)
  end

  test "should get index" do
    get clone_samples_url
    assert_response :success
  end

  test "should get new" do
    get new_clone_sample_url
    assert_response :success
  end

  test "should create clone_sample" do
    assert_difference('CloneSample.count') do
      post clone_samples_url, params: { clone_sample: {  } }
    end

    assert_redirected_to clone_sample_url(CloneSample.last)
  end

  test "should show clone_sample" do
    get clone_sample_url(@clone_sample)
    assert_response :success
  end

  test "should get edit" do
    get edit_clone_sample_url(@clone_sample)
    assert_response :success
  end

  test "should update clone_sample" do
    patch clone_sample_url(@clone_sample), params: { clone_sample: {  } }
    assert_redirected_to clone_sample_url(@clone_sample)
  end

  test "should destroy clone_sample" do
    assert_difference('CloneSample.count', -1) do
      delete clone_sample_url(@clone_sample)
    end

    assert_redirected_to clone_samples_url
  end
end
