require "application_system_test_case"

class FoldersTest < ApplicationSystemTestCase
  test "visiting the homepage when not signed in" do
    visit root_url
    assert_selector "h1", text: "Learn to love your browser again"
    save_and_open_screenshot
  end
end
