class CreateUserPreferences < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :country
    remove_column :users, :currency

    create_table :user_preferences do |t|
      t.references :user
      t.string :country
      t.string :currency
      t.string :language
      t.string :timezone
      t.timestamps
    end
  end
end
