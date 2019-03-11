require 'test_helper'

class SeniorsControllerTest < ActionController::TestCase
  setup do
    @senior = seniors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seniors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create senior" do
    assert_difference('Senior.count') do
      post :create, senior: { email: @senior.email, name: @senior.name }
    end

    assert_redirected_to senior_path(assigns(:senior))
  end

  test "should show senior" do
    get :show, id: @senior
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @senior
    assert_response :success
  end

  test "should update senior" do
    patch :update, id: @senior, senior: { email: @senior.email, name: @senior.name }
    assert_redirected_to senior_path(assigns(:senior))
  end

  test "should destroy senior" do
    assert_difference('Senior.count', -1) do
      delete :destroy, id: @senior
    end

    assert_redirected_to seniors_path
  end
end
