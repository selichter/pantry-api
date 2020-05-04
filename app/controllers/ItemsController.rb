class ItemsController < ApplicationController
  def create
    Item.create(item_params)
    render status: :created
  end

  private

  def item_params
    params.require(:item).permit(:name, :amount)
  end
end