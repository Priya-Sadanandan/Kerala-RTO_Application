require 'test_helper'

class RtocodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rtocode = rtocodes(:one)
  end

  test "should get index" do
    get rtocodes_url
    assert_response :success
  end

  test "should get new" do
    get new_rtocode_url
    assert_response :success
  end

  test "should create rtocode" do
    assert_difference('Rtocode.count') do
      post rtocodes_url, params: { rtocode: { code: @rtocode.code, district: @rtocode.district, office: @rtocode.office } }
    end

    assert_redirected_to rtocode_url(Rtocode.last)
  end

  test "should show rtocode" do
    get rtocode_url(@rtocode)
    assert_response :success
  end

  test "should get edit" do
    get edit_rtocode_url(@rtocode)
    assert_response :success
  end

  test "should update rtocode" do
    patch rtocode_url(@rtocode), params: { rtocode: { code: @rtocode.code, district: @rtocode.district, office: @rtocode.office } }
    assert_redirected_to rtocode_url(@rtocode)
  end

  test "should destroy rtocode" do
    assert_difference('Rtocode.count', -1) do
      delete rtocode_url(@rtocode)
    end

    assert_redirected_to rtocodes_url
  end
end
