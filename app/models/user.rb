# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :name, presence: true
  has_many :bricks
  has_one :shopping_cart
end
