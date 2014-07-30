require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "get new" do
    get :new
    assert_response :success
  end

  test "create user" do
    assert_difference('User.count') do
      post :create, user: { email: @user.email, last_login: @user.last_login, name: @user.name, password: @user.password }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "show user" do
    get :show, id: @user
    assert_response :success
  end

  test "get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "update user" do
    patch :update, id: @user, user: { email: @user.email, last_login: @user.last_login, name: @user.name, password: @user.password }
    assert_redirected_to user_path(assigns(:user))
  end

  test "destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
