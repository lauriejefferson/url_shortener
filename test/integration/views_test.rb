require "test_helper"

class UrlLinkTest < ActionDispatch::IntegrationTest
  test "visiting a link records a view" do
    link = url_links(:one)
    assert_difference "View.count" do
      assert_difference "link.view_count" do
        get view_path(link)
        assert_response :redirect
        follow_redirect!
        link.reload
      end
    end
  end

  test "visiting a link redirects to the URL" do
    link = url_links(:one)
    get view_path(link)
    assert_redirected_to link.url
  end
end
