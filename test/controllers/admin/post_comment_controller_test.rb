require "test_helper"

class Admin::PostCommentControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get admin_post_comment_destroy_url
    assert_response :success
  end
end
