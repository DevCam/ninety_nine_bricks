# == Schema Information
#
# Table name: bricks
#
#  id         :bigint           not null, primary key
#  on_sale    :boolean          default(FALSE), not null
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  realty_id  :bigint           not null
#  user_id    :bigint
#
# Indexes
#
#  index_bricks_on_realty_id  (realty_id)
#  index_bricks_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (realty_id => realties.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Brick, type: :model do

  context 'Associations' do
    it { should belong_to(:realty) }
    it { should belong_to(:user).without_validating_presence }
  end

  context 'Validations' do
    subject { build(:brick) }

    it do
      subject.on_sale = true
      should validate_presence_of(:price)
    end
  end
end
