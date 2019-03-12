ActiveAdmin.register Comment, as: 'NoteComments' do
  scope :all, default: true
  permit_params :body,:note_id

  # Customize columns displayed on the index screen in the table
    index do
      column :body
       column :note
       actions
    end
end
