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
class Brick < ApplicationRecord
  belongs_to :realty
  belongs_to :user, optional: true

  validates :price, presence: true, :if => :on_sale?
end
