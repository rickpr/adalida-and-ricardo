require 'test_helper'

class TimelinePostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timeline = timelines(:one)
    @timeline_post = timeline_posts(:one)
  end

  test "should get index" do
    get timeline_timeline_posts_url(@timeline)
    assert_response :success
  end

  test "should get new" do
    get new_timeline_timeline_post_url(@timeline)
    assert_response :success
  end

  test "should create timeline_post" do
    assert_difference('TimelinePost.count') do
      post timeline_timeline_posts_url(@timeline), params: {
        timeline_post: {
          body: @timeline_post.body,
          date: @timeline_post.date,
          description: @timeline_post.description,
          timeline_id: @timeline_post.timeline_id,
          title: @timeline_post.title 
        } 
      }
    end

    assert_redirected_to timeline_timeline_post_url(@timeline, TimelinePost.last)
  end

  test "should show timeline_post" do
    get timeline_timeline_post_url(@timeline, @timeline_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_timeline_timeline_post_url(@timeline, @timeline_post)
    assert_response :success
  end

  test "should update timeline_post" do
    patch timeline_timeline_post_url(@timeline, @timeline_post), params: {
      timeline_post: {
        body: @timeline_post.body,
        date: @timeline_post.date,
        description: @timeline_post.description,
        timeline_id: @timeline_post.timeline_id,
        title: @timeline_post.title
      }
    }
    assert_redirected_to timeline_timeline_post_url(@timeline, @timeline_post)
  end

  test "should destroy timeline_post" do
    assert_difference('TimelinePost.count', -1) do
      delete timeline_timeline_post_url(@timeline, @timeline_post)
    end

    assert_redirected_to timeline_timeline_posts_url(@timeline)
  end
end
