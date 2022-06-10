class CampersController < ApplicationController

    def index
        camper = Camper.all 
        render json: camper, except: [:created_at, :updated_at], status: :ok
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper, include: :activities, except: [:created_at, :updated_at], status: 
        else
            render json: {error: "Camper not found"}
        end
    end

    def create 
        camper = Camper.create(params.permit(:name, :age))
        if camper.valid?
            render json: camper, only: [:id, :name, :age], status: :created
        else
            render json: {errors: camper.errors.full_messages}, status: 500
        end
    end
end
