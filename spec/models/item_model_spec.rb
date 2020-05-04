require 'rails_helper'

RSpec.describe Item, :type => :model do
  it "is valid with valid attributes" do
    expect(Item.new).to be_valid
  end
end