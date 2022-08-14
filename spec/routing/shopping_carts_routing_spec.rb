require "rails_helper"

RSpec.describe ShoppingCartsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/shopping_carts").to route_to("shopping_carts#index")
    end

    it "routes to #show" do
      expect(get: "/shopping_carts/1").to route_to("shopping_carts#show", id: "1")
    end

    it "routes to #checkout" do
      expect(get: "/shopping_carts/1/checkout").to route_to("shopping_carts#checkout", id: "1")
    end

    it "routes to "

    it "routes to #complete_purchase" do
      expect(get: "/shopping_carts/1/complete_purchase").to route_to("shopping_carts#complete_purchase", id: "1")
    end

  end
end
