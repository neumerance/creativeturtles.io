ActiveAdmin.register Talent do
  permit_params :photo, 
                :email, 
                :handle, 
                :password, 
                :password_confirmation, 
                :first_name, 
                :last_name, 
                :country

  filter :email
  filter :handle
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
      f.input :photo, as: :file
      f.input :handle
      f.input :first_name
      f.input :last_name
      f.input :headline
      f.input :about
      f.input :country
    end

    actions
  end

  index do
    selectable_column
    column :photo do |i|
      if i.photo.attached?
        image_tag url_for(i.photo.variant(:thumb))
      end
    end
    column :email
    column :handle
    column :first_name
    column :last_name
    column :country

    actions
  end
end
