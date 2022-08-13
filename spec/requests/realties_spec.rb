require 'rails_helper'

RSpec.describe "/realties", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Realty. As you add validations to Realty, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { address: 'tranquility lane #123' }
    { img: 'https://images-na.ssl-images-amazon.com/images/I/61BHbnmoGDL.jpg' }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
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
