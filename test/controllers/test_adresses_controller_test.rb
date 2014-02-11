require 'test_helper'

class TestAdressesControllerTest < ActionController::TestCase
  setup do
    @test_adress = test_adresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_adresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_adress" do
    assert_difference('TestAdress.count') do
      post :create, test_adress: { birthday: @test_adress.birthday, city: @test_adress.city, first_name: @test_adress.first_name, name: @test_adress.name, street: @test_adress.street, title: @test_adress.title, zip: @test_adress.zip }
    end

    assert_redirected_to test_adress_path(assigns(:test_adress))
  end

  test "should show test_adress" do
    get :show, id: @test_adress
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_adress
    assert_response :success
  end

  test "should update test_adress" do
    patch :update, id: @test_adress, test_adress: { birthday: @test_adress.birthday, city: @test_adress.city, first_name: @test_adress.first_name, name: @test_adress.name, street: @test_adress.street, title: @test_adress.title, zip: @test_adress.zip }
    assert_redirected_to test_adress_path(assigns(:test_adress))
  end

  test "should destroy test_adress" do
    assert_difference('TestAdress.count', -1) do
      delete :destroy, id: @test_adress
    end

    assert_redirected_to test_adresses_path
  end
end
