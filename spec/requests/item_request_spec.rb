require "rails_helper"

RSpec.describe "Item endpoints", :type => :request do
  let(:valid_attributes) { {name: "steak", amount: 1} }

  it "creates an item" do
    post "/items", {:params => {:item => valid_attributes}}

    expect(response).to have_http_status(:created)
  end

end
