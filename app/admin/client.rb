ActiveAdmin.register Client do
  permit_params :email, :password, :password_confirmation, :first_name, :last_name

  filter :email
  filter :created_at

  form title: 'Talent' do |f|
    f.semantic_errors

    if f.object.new_record?
      inputs 'Logins' do
        f.input :email
        f.input :password, required: false
        f.input :password_confirmation, required: false
      end
    end


    inputs 'Abouts' do
      input :first_name
      input :last_name
    end

    actions
  end

  index do
    selectable_column
    column :email
    column :first_name
    column :last_name

    actions
  end
end
