require 'rails_helper'

RSpec.describe Location, type: :model do
  it 'is valid with valid attributes' do
    location = Location.new({ name: 'freezer' })
    expect(location).to be_valid
  end

  it 'is not valid with no attributes' do
    location = Location.new({})
    expect(location).to be_invalid
  end
end
