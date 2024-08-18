class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.integer :product_type, default: 1
      t.text :description
      t.string :external_link
      t.decimal :price, precision: 6, scale: 2
      t.references :user
      t.timestamps
    end
  end
end
