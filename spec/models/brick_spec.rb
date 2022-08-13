# == Schema Information
#
# Table name: bricks
#
#  id         :bigint           not null, primary key
#  on_sale    :boolean
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  realty_id  :bigint           not null
#
# Indexes
#
#  index_bricks_on_realty_id  (realty_id)
#
# Foreign Keys
#
#  fk_rails_...  (realty_id => realties.id)
#
require 'rails_helper'

RSpec.describe Brick, type: :model do

  context 'Associations' do
    it { should belong_to(:realty) }
  end

  context 'Validations' do
    subject { FactoryBot.build(:brick) }

    it do
      subject.on_sale = true
      should validate_presence_of(:price)
    end
  end
end
