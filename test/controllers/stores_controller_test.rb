require 'test_helper'

class StoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    create_stores
end
  teardown do
    remove_stores
end

  test "should get index" do
    get stores_url
    assert_response :success
  end

    test "should get active stores" do
    get active_stores_path
    assert_response :success
  end
    test "should get inactive stores" do
    get inactive_stores_path
    assert_response :success
  end
  test "should get new" do
    get new_store_path
    assert_response :success
  end

  test "should create store" do
    assert_difference('Store.count') do
      post stores_url, params: { store: { active: @cmu.active, city: @cmu.city, name: @cmu.name, phone: @cmu.phone, state: @cmu.state, street: @cmu.street, zip: @cmu.zip } }
    end

    assert_redirected_to store_url(Store.last)
  end

  test "should show store" do
    get store_url(@cmu)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_url(@cmu)
    assert_response :success
    
  end

  test "should update store" do
    patch store_url(@cmu), params: { store: { active: @cmu.active, city: @cmu.city, name: @cmu.name, phone: @cmu.phone, state: @cmu.state, street: @cmu.street, zip: @cmu.zip } }
    assert_redirected_to store_url(@cmu)
  end

  test "should destroy store" do
    assert_difference('Store.count', -1) do
      delete store_url(@cmu)
    end

    assert_redirected_to stores_url
  end
end
