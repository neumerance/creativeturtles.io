ActiveAdmin.register Client do
  permit_params :email, :password, :password_confirmation

  filter :email
  filter :created_at

  form title: 'Talent' do |f|
    f.semantic_errors

    inputs 'Logins' do
      input :email
      input :password
      input :password_confirmation
    end

    inputs 'Abouts' do
      input :first_name
      input :last_name
      input :country
    end

    actions
  end

  index do
    selectable_column
    column :email
    column :first_name
    column :last_name
    column :country
  end
end
