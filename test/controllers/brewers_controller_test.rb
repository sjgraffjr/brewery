require 'test_helper'

class BrewersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @brewer = brewers(:one)
  end

  test "should get index" do
    get brewers_url
    assert_response :success
  end

  test "should get new" do
    get new_brewer_url
    assert_response :success
  end

  test "should create brewer" do
    assert_difference('Brewer.count') do
      post brewers_url, params: { brewer: { description: @brewer.description, ext_id: @brewer.ext_id, is_organic: @brewer.is_organic, name: @brewer.name, status: @brewer.status, status_display: @brewer.status_display, website: @brewer.website } }
    end

    assert_redirected_to brewer_url(Brewer.last)
  end

  test "should show brewer" do
    get brewer_url(@brewer)
    assert_response :success
  end

  test "should get edit" do
    get edit_brewer_url(@brewer)
    assert_response :success
  end

  test "should update brewer" do
    patch brewer_url(@brewer), params: { brewer: { description: @brewer.description, ext_id: @brewer.ext_id, is_organic: @brewer.is_organic, name: @brewer.name, status: @brewer.status, status_display: @brewer.status_display, website: @brewer.website } }
    assert_redirected_to brewer_url(@brewer)
  end

  test "should destroy brewer" do
    assert_difference('Brewer.count', -1) do
      delete brewer_url(@brewer)
    end

    assert_redirected_to brewers_url
  end
end
