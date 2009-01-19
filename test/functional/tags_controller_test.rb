require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tags" do
    assert_difference('Tags.count') do
      post :create, :tags => { }
    end

    assert_redirected_to tags_path(assigns(:tags))
  end

  test "should show tags" do
    get :show, :id => tags(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tags(:one).id
    assert_response :success
  end

  test "should update tags" do
    put :update, :id => tags(:one).id, :tags => { }
    assert_redirected_to tags_path(assigns(:tags))
  end

  test "should destroy tags" do
    assert_difference('Tags.count', -1) do
      delete :destroy, :id => tags(:one).id
    end

    assert_redirected_to tags_path
  end
end
