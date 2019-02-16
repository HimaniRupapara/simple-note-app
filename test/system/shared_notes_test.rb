require "application_system_test_case"

class SharedNotesTest < ApplicationSystemTestCase
  setup do
    @shared_note = shared_notes(:one)
  end

  test "visiting the index" do
    visit shared_notes_url
    assert_selector "h1", text: "Shared Notes"
  end

  test "creating a Shared note" do
    visit shared_notes_url
    click_on "New Shared Note"

    fill_in "Email", with: @shared_note.email
    fill_in "Note", with: @shared_note.note_id
    fill_in "Permission", with: @shared_note.permission_id
    click_on "Create Shared note"

    assert_text "Shared note was successfully created"
    click_on "Back"
  end

  test "updating a Shared note" do
    visit shared_notes_url
    click_on "Edit", match: :first

    fill_in "Email", with: @shared_note.email
    fill_in "Note", with: @shared_note.note_id
    fill_in "Permission", with: @shared_note.permission_id
    click_on "Update Shared note"

    assert_text "Shared note was successfully updated"
    click_on "Back"
  end

  test "destroying a Shared note" do
    visit shared_notes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shared note was successfully destroyed"
  end
end
