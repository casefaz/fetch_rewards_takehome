class Api::V1::PayerBalancesController < ApplicationController
  def index
    render json: PayerBalancesService.()
  end
end