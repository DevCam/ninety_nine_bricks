# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Associations' do
    it { should have_many(:bricks) }
  end

  context 'Validations' do
    it {should validate_presence_of :name}
  end
end
