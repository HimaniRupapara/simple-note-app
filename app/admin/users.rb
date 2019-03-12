ActiveAdmin.register User do
  scope :all, default: true
  permit_params :email, :password, :confirm_password
  show do
    panel 'User Details' do
      attributes_table_for user do
        row :email
      end
    end
  end
end
