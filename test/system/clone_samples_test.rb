require "application_system_test_case"

class CloneSamplesTest < ApplicationSystemTestCase
  setup do
    @clone_sample = clone_samples(:one)
  end

  test "visiting the index" do
    visit clone_samples_url
    assert_selector "h1", text: "Clone Samples"
  end

  test "creating a Clone sample" do
    visit clone_samples_url
    click_on "New Clone Sample"

    click_on "Create Clone sample"

    assert_text "Clone sample was successfully created"
    click_on "Back"
  end

  test "updating a Clone sample" do
    visit clone_samples_url
    click_on "Edit", match: :first

    click_on "Update Clone sample"

    assert_text "Clone sample was successfully updated"
    click_on "Back"
  end

  test "destroying a Clone sample" do
    visit clone_samples_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Clone sample was successfully destroyed"
  end
end
