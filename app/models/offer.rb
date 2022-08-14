# == Schema Information
#
# Table name: offers
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  brick_id         :bigint
#  shopping_cart_id :bigint
#
# Indexes
#
#  index_offers_on_brick_id          (brick_id)
#  index_offers_on_shopping_cart_id  (shopping_cart_id)
#
class Offer < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :brick

  validates_uniqueness_of :shopping_cart_id, :scope => :brick_id, :message => "can only have one standing offer for a given brick"

  validates_each :brick_id do |record, attr|
    unless record.brick.nil?
      record.errors.add(attr, 'is not for sale') unless record.brick.on_sale?
    end
  end

end
