class Api::V1::TransactionsController < ApplicationController
  def create
    new_transaction = Transaction.create!(transaction_params)
    render json: TransactionSerializer.new(new_transaction), status: :created
  end

  private

  def transaction_params
    params.require(:transaction).permit(:payer, :points, :timestamp, :user_id)
  end
end