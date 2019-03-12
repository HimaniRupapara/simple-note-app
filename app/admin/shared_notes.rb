ActiveAdmin.register SharedNote do
  scope :all, default: true
  permit_params :note_id, :email
  index do
    column :note
    column :user
    column :email
    actions
  end
  show do
    panel 'SharedNote Details' do
      attributes_table_for shared_note do
        row :user
        row :note
        row :email

      end
    end
  end
end
