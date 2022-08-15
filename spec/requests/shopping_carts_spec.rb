require 'rails_helper'

RSpec.describe "/shopping_carts", type: :request do

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

  describe "GET /complete_purchase" do
    context "on correct state" do

      it "removes offers" do
        shopping_cart = create(:shopping_cart, {terms_accepted: true})
        brick = create(:brick, {on_sale: true, price: 123})
        shopping_cart.bricks << brick

        expect {
          get complete_purchase_shopping_cart_url(shopping_cart)
        }.to change(Offer, :count).by -1
      end

      it "adds brick to user" do
        shopping_cart = create(:shopping_cart, {terms_accepted: true})
        brick = create(:brick, {on_sale: true, price: 123})
        shopping_cart.bricks << brick

        get complete_purchase_shopping_cart_url(shopping_cart)

        expect(shopping_cart.user.bricks).to contain_exactly(brick)
      end

      it "handles brick collisions" do
        cart_a = create(:shopping_cart, {terms_accepted: true})
        cart_b = create(:shopping_cart, {terms_accepted: true})

        brick = create(:brick, {on_sale: true, price: 123})
        cart_a.bricks << brick
        cart_b.bricks << brick

        # both users added the brick to their cart
        expect {
          get complete_purchase_shopping_cart_url(cart_a)
          get complete_purchase_shopping_cart_url(cart_b)
        }.to change(Offer, :count).by -1 #only one offer is resolved!
      end


    end

    context "on incorrect state" do
      it "does not checkout if terms are not accepted" do
        shopping_cart = create(:shopping_cart)
        expect {
          get complete_purchase_shopping_cart_url(shopping_cart)
        }.to change(Offer, :count).by(0)
      end
    end

  end

end
