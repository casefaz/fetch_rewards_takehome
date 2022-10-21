require 'rails_helper'

RSpec.describe 'User point spend' do
  context 'happy path' do
    it 'successfuly updates points per transaction after point spend' do
      user = User.create!(name: 'Bundles Gerald')
      transaction1 = Transaction.create!(payer: "DANNON", points: 1000, timestamp: "2020-11-02T14:00:00Z", user_id: user.id) 
      transaction2 = Transaction.create!(payer: "UNILEVER", points: 200, timestamp: "2020-10-31T11:00:00Z", user_id: user.id) 
      transaction3 = Transaction.create!(payer: "DANNON", points: -200, timestamp: "2020-10-31T15:00:00Z", user_id: user.id) 
      transaction4 = Transaction.create!(payer: "MILLER COORS", points: 10000, timestamp: "2020-11-01T14:00:00Z", user_id: user.id) 
      transaction5 = Transaction.create!(payer: "DANNON", points: 300, timestamp: "2020-10-31T10:00:00Z", user_id: user.id)

      spend_params = {"points": 5000}

      post "/api/v1/users/#{user.id}/spend", params: spend_params

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      return_balances = JSON.parse(response.body, symbolize_names: true)
      expect(return_balances).to be_a(Array)
      
      breakdown = return_balances.first

      expect(breakdown).to have_key(:payer)
      expect(breakdown).to have_key(:points)
      expect(breakdown[:payer]).to eq('DANNON')
      expect(breakdown[:points]).to eq(-100)
    end
  end
end