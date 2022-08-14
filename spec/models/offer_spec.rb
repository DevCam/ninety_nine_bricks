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
require 'rails_helper'

RSpec.describe Offer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
