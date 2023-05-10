class GymsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_error

  def show
    gym = find_gym
    render json: gym, status: :ok
  end

  def destroy
    gym = find_gym
    gym.destroy
    head :no_content
  end

  private

  def find_gym
    Gym.find(params[:id])
  end

  def not_found_error
    render json: {error: "Gym not found"}, status: :not_found
  end

end
