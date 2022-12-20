class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  # rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def unprocessable_entity(invalid)
  render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity 
  end

  # def not_found
  # render json: {error: "Camper not found"}, status: :not_found
  # end

end


