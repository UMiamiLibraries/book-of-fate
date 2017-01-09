require 'test_helper'

class TagMappingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag_mapping = tag_mappings(:one)
  end

  test "should get index" do
    get tag_mappings_url
    assert_response :success
  end

  test "should get new" do
    get new_tag_mapping_url
    assert_response :success
  end

  test "should create tag_mapping" do
    assert_difference('TagMapping.count') do
      post tag_mappings_url, params: { tag_mapping: { tag_id: @tag_mapping.tag_id, transcription_id: @tag_mapping.transcription_id } }
    end

    assert_redirected_to tag_mapping_url(TagMapping.last)
  end

  test "should show tag_mapping" do
    get tag_mapping_url(@tag_mapping)
    assert_response :success
  end

  test "should get edit" do
    get edit_tag_mapping_url(@tag_mapping)
    assert_response :success
  end

  test "should update tag_mapping" do
    patch tag_mapping_url(@tag_mapping), params: { tag_mapping: { tag_id: @tag_mapping.tag_id, transcription_id: @tag_mapping.transcription_id } }
    assert_redirected_to tag_mapping_url(@tag_mapping)
  end

  test "should destroy tag_mapping" do
    assert_difference('TagMapping.count', -1) do
      delete tag_mapping_url(@tag_mapping)
    end

    assert_redirected_to tag_mappings_url
  end
end
