class SpicesController < ApplicationController

    before_action :find_spices, only: [:update, :destroy]

    def index
        render json: Spice.all
    end

    def create 
        new_spice = Spice.create!(spice_params)
        render json: new_spice, status: 201
    end

    def update
        @spice.update!(spice_params)
        render json: @spice
    end

    def destroy
        @spice.destroy
        render json: @spice
    end



    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spices
        @spice = Spice.find(params[:id])
    end

end
