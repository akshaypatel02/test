require 'test_helper'

class BlogArticalsControllerTest < ActionController::TestCase
  setup do
    @blog_artical = blog_articals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blog_articals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blog_artical" do
    assert_difference('BlogArtical.count') do
      post :create, blog_artical: { author: @blog_artical.author, text: @blog_artical.text, title: @blog_artical.title }
    end

    assert_redirected_to blog_artical_path(assigns(:blog_artical))
  end

  test "should show blog_artical" do
    get :show, id: @blog_artical
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blog_artical
    assert_response :success
  end

  test "should update blog_artical" do
    patch :update, id: @blog_artical, blog_artical: { author: @blog_artical.author, text: @blog_artical.text, title: @blog_artical.title }
    assert_redirected_to blog_artical_path(assigns(:blog_artical))
  end

  test "should destroy blog_artical" do
    assert_difference('BlogArtical.count', -1) do
      delete :destroy, id: @blog_artical
    end

    assert_redirected_to blog_articals_path
  end
end
