# == Schema Information
#
# Table name: shopping_carts
#
#  id             :bigint           not null, primary key
#  terms_accepted :boolean          default(FALSE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_shopping_carts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe ShoppingCart, type: :model do

  context 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:bricks) }
  end

  context 'Validations' do
  end

end
