class ItemsController < ApplicationController
  def index
    @items = Item.all
    render json: @items, status: :ok
  end

  def show
    item = Item.find_by_id(params[:id])
    if item.nil?
      render json: { data: 'Item not found' }, status: 404
    else
      render json: item, status: :ok
    end
  end

  def create
    item = Item.new(item_params)
    if item.save
      render status: :created
    else
      render json: { data: item.errors }, status: :bad_request

    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: item, status: 201
    else
      render json: item, status: :bad_request
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :amount)
  end
end
