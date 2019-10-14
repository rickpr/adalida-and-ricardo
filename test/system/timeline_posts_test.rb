require "application_system_test_case"

class TimelinePostsTest < ApplicationSystemTestCase
  setup do
    @timeline_post = timeline_posts(:one)
  end

  test "visiting the index" do
    visit timeline_posts_url
    assert_selector "h1", text: "Timeline Posts"
  end

  test "creating a Timeline post" do
    visit timeline_posts_url
    click_on "New Timeline Post"

    fill_in "Body", with: @timeline_post.body
    fill_in "Date", with: @timeline_post.date
    fill_in "Description", with: @timeline_post.description
    fill_in "Timeline", with: @timeline_post.timeline_id
    fill_in "Title", with: @timeline_post.title
    click_on "Create Timeline post"

    assert_text "Timeline post was successfully created"
    click_on "Back"
  end

  test "updating a Timeline post" do
    visit timeline_posts_url
    click_on "Edit", match: :first

    fill_in "Body", with: @timeline_post.body
    fill_in "Date", with: @timeline_post.date
    fill_in "Description", with: @timeline_post.description
    fill_in "Timeline", with: @timeline_post.timeline_id
    fill_in "Title", with: @timeline_post.title
    click_on "Update Timeline post"

    assert_text "Timeline post was successfully updated"
    click_on "Back"
  end

  test "destroying a Timeline post" do
    visit timeline_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Timeline post was successfully destroyed"
  end
end
