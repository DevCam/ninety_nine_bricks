# == Schema Information
#
# Table name: realties
#
#  id         :bigint           not null, primary key
#  address    :text
#  img        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Realty, type: :model do
  describe 'Associations' do
    it { should have_many(:bricks) }
  end
end
