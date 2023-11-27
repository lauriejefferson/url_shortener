require "test_helper"

class UrlLinkIntegrationTest < ActionDispatch::IntegrationTest
  test "links index" do
    get url_links_path
    assert_response :ok
  end

  test "links index pagination" do
    get url_links_path
    assert_response :ok
  end

  test "links index handles pagination overflow" do
    UrlLink.destroy_all
    get url_links_path(page: 2)
    assert_redirected_to root_path
  end

  test "link show" do
    get url_link_path(url_links(:anonymous))
    assert_response :ok
  end

  test "create link requires a url" do
    post url_links_path, params: {url_link: {url: ""}}
    assert_response :unprocessable_entity
  end
  test "create link as guest" do
    assert_difference "UrlLink.count" do
      post url_links_path(format: :turbo_stream), params: {url_link: {url: "https://httpbin.org"}}
      assert_response :ok
      assert_nil UrlLink.last.user_id
    end

  end
  test "create link as user" do
    user = users(:one)
    sign_in user
    assert_difference "UrlLink.count" do
      post url_links_path(format: :turbo_stream), params: {url_link: {url: "https://httpbin.org"}}
      assert_response :ok
      assert_equal user.id, UrlLink.last.user_id
    end

  end
  test "cannot edit link as guest" do
    get edit_url_link_path(url_links(:anonymous))
    assert_response :redirect

  end
  test "guest cannot edit user's link" do
    get edit_url_link_path(url_links(:one))
    assert_response :redirect

  end
  test "user can edit their own link" do
    sign_in users(:one)
    get edit_url_link_path((url_links(:one)))
    assert_response :ok
  end

  test "user cannot edit another user's link" do
    sign_in users(:one)
    get edit_url_link_path(url_links(:two))
    assert_response :redirect
  end

  test "user cannot edit anonymous link" do
    sign_in users(:one)
    get edit_url_link_path(url_links(:anonymous))
    assert_response :redirect
  end
end
