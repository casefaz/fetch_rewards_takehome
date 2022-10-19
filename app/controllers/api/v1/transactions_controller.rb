class Api::V1::TransactionsController < ApplicationController
  def create
    new_transaction = Transaction.create!(transaction_params)
    if new_transaction.save
      render json: TransactionSerializer.new(new_transaction), status: :created
    else
      render status: 404
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:payer, :points, :created_at, :user_id)
  end
end