class Api::V1::UsersController < ApplicationController
  def spend_points
    differences = SpendPointsService.call(points: spend_points_params[:points].to_i)
    render json: differences
  end

  def spend_points_params
    params.permit(:points)
  end
end