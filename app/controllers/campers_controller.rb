class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    # rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

def index
    campers = Camper.all
    render json: campers, status: :ok
end

def show
    camper = Camper.find_by!(id: params[:id])
    render json: camper, serializer: CamperShowSerializer, status: :ok
end

def create
    new_camper = Camper.create!(camper_params)
    render json: new_camper, status: :created
end

private

def camper_params
    params.permit(:name, :age)
end

def not_found
    render json: {error: "Camper not found"}, status: :not_found
end

# def unprocessable_entity(invalid)
#     render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity 
# end

end
