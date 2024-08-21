ActiveAdmin.register Product do
  permit_params :name,
    :price,
    :product_type, 
    :description,
    :external_link,
    :package,
    :video,
    :user_id,
    images: []

  filter :name
  filter :slug
  filter :created_at

  form title: 'Product' do |f|
    f.semantic_errors

    inputs 'Details' do
      f.input :name
      f.input :price
      f.input :product_type
      f.input :description
      f.input :external_link
    end

    inputs 'Product Owner' do
      f.input :user_id, as: :select, collection: Talent.all.collect { |u| ["#{u.first_name} #{u.last_name}", u.id] }, include_blank: 'Select a Talent'
    end

    inputs 'Media' do
      f.input :images, as: :file, input_html: { multiple: true }
      f.input :video, as: :file
      f.input :package, as: :file
    end

    actions
  end

  index do
    selectable_column
    column :name
    column :slug
    column do |i|
      if i.talent
        "#{i.talent.full_name} | #{i.talent.handle}"
      end
    end

    actions
  end

  show do
    attributes_table do
      row :talent do |i|
        if i.talent
          "#{i.talent.full_name} | #{i.talent.handle}"
        end
      end  
      row :name
      row :slug
      row :description
      row :images do |i|
        if i.images.attached?
          i.images.map do |image|
            image_tag url_for(image.variant(:thumb))
          end.join(", ").html_safe
        end
      end

      row :video do |i|
        if i.video.attached?
          link_to 'View Video', rails_blob_path(i.video, disposition: "inline"), target: "_blank"
        end
      end

      row :package do |i|
        if i.package.attached?
          link_to 'Package', rails_blob_path(i.package, disposition: "inline"), target: "_blank"
        end
      end
    end
  end
end
