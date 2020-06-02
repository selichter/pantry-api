class ItemsController < ApplicationController

  def index
    @items = Item.all
    render json: @items, status: :ok
  end

  def create
    item = Item.new(item_params)
    if item.save
      render status: :created
    else
      render json: { data: item.errors }, status: :bad_request

    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :amount)

  end
end