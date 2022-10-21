require 'rails_helper'

RSpec.describe 'Point Balances Index' do
  context 'happy path' do
    it 'shows the balances of all the points by payers' do
      user = User.create!(name: 'Jingle Bells')

      transaction1 = Transaction.create!(payer: "DANNON", points: 1000, timestamp: "2020-11-02T14:00:00Z", user_id: user.id) 
      transaction2 = Transaction.create!(payer: "UNILEVER", points: 200, timestamp: "2020-10-31T11:00:00Z", user_id: user.id) 
      transaction3 = Transaction.create!(payer: "DANNON", points: -200, timestamp: "2020-10-31T15:00:00Z", user_id: user.id)

      get '/api/v1/payer_balances'

      expect(response).to be_successful

      get_balances = JSON.parse(response.body, symbolize_names: true)

      expect(get_balances).to eq({:UNILEVER=>200, :DANNON=>800})
    end
  end
end