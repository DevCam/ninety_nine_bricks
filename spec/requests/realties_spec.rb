require 'rails_helper'

RSpec.describe "/realties", type: :request do
  let(:valid_attributes) {
    attributes_for(:realty)
  }

  describe "GET /index" do
    it "renders a successful response" do
      Realty.create! valid_attributes
      get realties_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      realty = Realty.create! valid_attributes
      get realty_url(realty)
      expect(response).to be_successful
    end
  end
end
