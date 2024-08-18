ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  filter :email
  filter :created_at

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs          # builds an input field for every attribute
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

  form title: 'A custom title' do |f|
    f.semantic_errors

    inputs 'Details' do
      input :email
      input :password
      input :password_confirmation
    end
    
    actions
  end

end
