require 'rails_helper'

RSpec.describe 'Create new transaction', type: :request do
  context 'happy path' do
    it 'successfully creates a new transaction' do
      user = User.create!(name: 'Gil Pickles')
      
      transaction_params = {
        payer: 'DANNON',
        points: 1000,
        timestamp: Date.today,
        user_id: user.id
      }

      expect(user.transactions).to eq([])

      post '/api/v1/transactions', params: JSON.generate(transaction: transaction_params)
      created_transaction = Transaction.last

      expect(response).to be_successful
      expect(response).to have_http_status(201)
    end
  end
end