require 'rails_helper'

RSpec.describe "/shopping_carts", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # ShoppingCart. As you add validations to ShoppingCart, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:shopping_cart)
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      ShoppingCart.create! valid_attributes
      get shopping_carts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      shopping_cart = ShoppingCart.create! valid_attributes
      get shopping_cart_url(shopping_cart)
      expect(response).to be_successful
    end
  end

end
