class AddDetailsToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :handle, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :country, :string
    add_column :users, :headline, :text
    add_column :users, :about, :text
    add_column :users, :user_type, :integer, default: 1
  end
end
