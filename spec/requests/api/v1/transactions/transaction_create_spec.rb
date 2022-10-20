require 'rails_helper'

RSpec.describe 'Create new transaction', type: :request do
  context 'happy path' do
    it 'successfully creates a new transaction' do
      user = User.create!(name: 'Gil Pickles')

      transaction_params = {
        payer: 'DANNON',
        points: 1000,
        user_id: user.id,
        timestamp: Time.now
      }
      headers = { 'CONTENT_TYPE' => 'application/json'}

      expect(user.transactions).to eq([])

      post '/api/v1/transactions', headers: headers, params: JSON.generate(transaction: transaction_params)
      created_transaction = Transaction.last

      expect(user.transactions.count).to eq(1)
      expect(response).to be_successful
      expect(response).to have_http_status(201)

      parsed_transaction = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_transaction).to be_a(Hash)
      expect(parsed_transaction[:data]).to have_key(:id)
      expect(parsed_transaction[:data]).to have_key(:type)
      expect(parsed_transaction[:data]).to have_key(:attributes)
      expect(parsed_transaction[:data][:attributes]).to have_key(:payer)
      expect(parsed_transaction[:data][:attributes]).to have_key(:points)
      expect(parsed_transaction[:data][:attributes]).to have_key(:timestamp)
      expect(parsed_transaction[:data][:attributes]).to have_key(:user_id)
    end
  end

  context 'sad path' do
    it 'renders an error if information is missing' do
      user = User.create!(name: 'Gil Pickles')

      transaction_params = {
        payer: 'DANNON',
        user_id: user.id
      }
      headers = { 'CONTENT_TYPE' => 'application/json'}

      expect(user.transactions).to eq([])

      post '/api/v1/transactions', headers: headers, params: JSON.generate(transaction: transaction_params)

      expect(user.transactions).to eq([])
      expect(response).to_not be_successful
      expect(response).to have_http_status(404)
    end
  end
end