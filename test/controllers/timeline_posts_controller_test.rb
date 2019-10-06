require 'test_helper'

class TimelinePostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timeline_post = timeline_posts(:one)
  end

  test "should get index" do
    get timeline_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_timeline_post_url
    assert_response :success
  end

  test "should create timeline_post" do
    assert_difference('TimelinePost.count') do
      post timeline_posts_url, params: { timeline_post: { body: @timeline_post.body, date: @timeline_post.date, description: @timeline_post.description, image_alt_text: @timeline_post.image_alt_text, timeline_id: @timeline_post.timeline_id, title: @timeline_post.title } }
    end

    assert_redirected_to timeline_post_url(TimelinePost.last)
  end

  test "should show timeline_post" do
    get timeline_post_url(@timeline_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_timeline_post_url(@timeline_post)
    assert_response :success
  end

  test "should update timeline_post" do
    patch timeline_post_url(@timeline_post), params: { timeline_post: { body: @timeline_post.body, date: @timeline_post.date, description: @timeline_post.description, image_alt_text: @timeline_post.image_alt_text, timeline_id: @timeline_post.timeline_id, title: @timeline_post.title } }
    assert_redirected_to timeline_post_url(@timeline_post)
  end

  test "should destroy timeline_post" do
    assert_difference('TimelinePost.count', -1) do
      delete timeline_post_url(@timeline_post)
    end

    assert_redirected_to timeline_posts_url
  end
end
