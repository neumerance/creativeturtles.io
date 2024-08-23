# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
admin = AdminUser.create!(email: 'dev@creativeturtles.io', password: 'ABC12abc', password_confirmation: 'ABC12abc')

6.times do
  sleep 1
  talent = FactoryBot.create(:talent)
  3.times do
    FactoryBot.create(:product, talent: talent, product_type: :digital)
  end
end
