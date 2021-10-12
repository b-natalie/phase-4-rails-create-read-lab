class PlantsController < ApplicationController
    wrap_parameters format: []

    def index
        plants = Plant.all
        render json: plants, except: [:created_at, :updated_at]
    end

    def show
        plant = Plant.find(params[:id])
        render json: plant, except: [:created_at, :updated_at]
    end

    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
    end

end
