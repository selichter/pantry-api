require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  include Capybara::DSL

  describe 'POST items' do
    it 'persists item to database' do
      post :create, {:params => {:item => {:name => "steak", :amount => 1}}}
      first_item = Item.first

      expect(Item.all.count).to eq 1
      expect(first_item.name).to eq "steak"
      expect(first_item.amount).to eq 1

    end
  end
end
