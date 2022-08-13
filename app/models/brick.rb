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
class Brick < ApplicationRecord
  belongs_to :realty

  validates :price, presence: true, :if => :on_sale?
end
