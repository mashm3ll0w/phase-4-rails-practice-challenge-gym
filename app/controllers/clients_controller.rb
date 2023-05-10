class ClientsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_error

  def show
    client = find_client
    render json: client, status: :ok
  end

  private

  def find_client
    Client.find(params[:id])
  end

  def not_found_error
    render json: {error: "Client not found"}, status: :not_found
  end
end
