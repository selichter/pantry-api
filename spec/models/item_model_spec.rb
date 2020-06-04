require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'is valid with valid attributes' do
    item = Item.new({ name: 'steak', amount: 1 })
    expect(item).to be_valid
  end

  it 'is invalid without a name' do
    item = Item.new({ amount: 1 })
    expect(item).to be_invalid
    expect(item.errors.messages).to eq({ name: ["can't be blank"] })
  end

  it 'is invalid without an amount' do
    item = Item.new({ name: 'fruit' })
    expect(item).to be_invalid
    error = item.errors.messages[:amount][0]
    expect(error).to eq("can't be blank")
  end

  it 'requires amount to be an int' do
    item = Item.new({ name: 'name', amount: 'one' })
    expect(item).to be_invalid
    error = item.errors.messages[:amount][0]
    expect(error).to eq('is not a number')
  end

  it 'is not valid with no attributes' do
    item = Item.new({})
    expect(item).to be_invalid
  end
end
