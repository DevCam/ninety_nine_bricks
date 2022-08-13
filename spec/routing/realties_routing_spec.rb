require "rails_helper"

RSpec.describe RealtiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/realties").to route_to("realties#index")
    end

    it "routes to #show" do
      expect(get: "/realties/1").to route_to("realties#show", id: "1")
    end
  end
end
