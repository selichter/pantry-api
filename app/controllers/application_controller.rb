class ApplicationController < ActionController::API
  def index
    render json: 'something else'
  end
end

