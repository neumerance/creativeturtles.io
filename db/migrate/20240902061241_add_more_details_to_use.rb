class AddMoreDetailsToUse < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :roles, :string, array: true, default: []
    add_column :users, :currency, :string, default: "USD"
  end
end
