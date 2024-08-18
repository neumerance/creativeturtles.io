require 'rails_helper'

RSpec.describe Product, type: :model do
  subject(:product) { build(:product) }

  describe "associations" do
    it { should belong_to(:talent).with_foreign_key(:user_id) }
  end
  
  describe "slug" do
    subject { create(:product).slug }

    it { is_expected.to be_present }
  end

  it { should define_enum_for(:product_type).with_values(%i[digital physical]) }
end
