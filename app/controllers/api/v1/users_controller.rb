class Api::V1::UsersController < ApplicationController
  def spend_points
    differences = [
      { "payer": "DANNON", "points": -100 },
      { "payer": "UNILEVER", "points": -200 },
      { "payer": "MILLER COORS", "points": -4_700 }
      ]
    render json: differences
  end
end