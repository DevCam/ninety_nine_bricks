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
class Realty < ApplicationRecord
  has_many :bricks
end
