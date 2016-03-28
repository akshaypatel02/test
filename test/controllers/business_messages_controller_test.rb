require 'test_helper'

class BusinessMessagesControllerTest < ActionController::TestCase
  setup do
    @business_message = business_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:business_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create business_message" do
    assert_difference('BusinessMessage.count') do
      post :create, business_message: { content: @business_message.content, title: @business_message.title, user_id: @business_message.user_id }
    end

    assert_redirected_to business_message_path(assigns(:business_message))
  end

  test "should show business_message" do
    get :show, id: @business_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @business_message
    assert_response :success
  end

  test "should update business_message" do
    patch :update, id: @business_message, business_message: { content: @business_message.content, title: @business_message.title, user_id: @business_message.user_id }
    assert_redirected_to business_message_path(assigns(:business_message))
  end

  test "should destroy business_message" do
    assert_difference('BusinessMessage.count', -1) do
      delete :destroy, id: @business_message
    end

    assert_redirected_to business_messages_path
  end
end
