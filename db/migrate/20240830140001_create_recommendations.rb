class CreateRecommendations < ActiveRecord::Migration[7.1]
  def change
    create_table :recommendations do |t|
      t.text :message
      t.integer :ratings, default: 1
      t.references :user
      t.references :commendable, polymorphic: true, null: false
      t.timestamps
    end
  end
end
