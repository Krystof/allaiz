require 'test_helper'

class AdhesionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adhesions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create adhesion" do
    assert_difference('Adhesion.count') do
      post :create, :adhesion => { }
    end

    assert_redirected_to adhesion_path(assigns(:adhesion))
  end

  test "should show adhesion" do
    get :show, :id => adhesions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => adhesions(:one).to_param
    assert_response :success
  end

  test "should update adhesion" do
    put :update, :id => adhesions(:one).to_param, :adhesion => { }
    assert_redirected_to adhesion_path(assigns(:adhesion))
  end

  test "should destroy adhesion" do
    assert_difference('Adhesion.count', -1) do
      delete :destroy, :id => adhesions(:one).to_param
    end

    assert_redirected_to adhesions_path
  end
end
