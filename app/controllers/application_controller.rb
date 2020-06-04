class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  def index
    render json: 'something else'
  end
end
