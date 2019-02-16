require 'test_helper'

class SharedNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shared_note = shared_notes(:one)
  end

  test "should get index" do
    get shared_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_shared_note_url
    assert_response :success
  end

  test "should create shared_note" do
    assert_difference('SharedNote.count') do
      post shared_notes_url, params: { shared_note: { email: @shared_note.email, note_id: @shared_note.note_id, permission_id: @shared_note.permission_id } }
    end

    assert_redirected_to shared_note_url(SharedNote.last)
  end

  test "should show shared_note" do
    get shared_note_url(@shared_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_shared_note_url(@shared_note)
    assert_response :success
  end

  test "should update shared_note" do
    patch shared_note_url(@shared_note), params: { shared_note: { email: @shared_note.email, note_id: @shared_note.note_id, permission_id: @shared_note.permission_id } }
    assert_redirected_to shared_note_url(@shared_note)
  end

  test "should destroy shared_note" do
    assert_difference('SharedNote.count', -1) do
      delete shared_note_url(@shared_note)
    end

    assert_redirected_to shared_notes_url
  end
end
