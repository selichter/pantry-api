module Api
  module V1
    class LocationsController < ApplicationController
      def index
        locations = Location.all
        render json: locations, status: :ok
      end

      def show
        location = Location.find_by_id(params[:id])
        if location.nil?
          render json: { data: 'Location not found' }, status: :not_found
        else
          render json: location, status: :ok
        end
      end

      def create
        location = Location.new(location_params)
        if location.save
          render status: :created
        else
          render json: { data: location.errors }, status: :unprocessable_entity
        end
      end

      private

      def location_params
        params.require(:location).permit(:name)
      end
    end
  end
end
