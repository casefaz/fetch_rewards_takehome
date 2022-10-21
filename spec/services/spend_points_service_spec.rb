require 'rails_helper'

RSpec.describe SpendPointsService do
  xit 'spends points and returns payer with point balance being the difference' do
    user = User.create!(name: 'Bundles Gerald')
    transaction2 = Transaction.create!(payer: "UNILEVER", points: 200, timestamp: "2020-10-31T11:00:00Z", user_id: user.id) 
    transaction3 = Transaction.create!(payer: "DANNON", points: 200, timestamp: "2020-10-31T15:00:00Z", user_id: user.id)

    expected = [
      {"payer": "Dannon", "points": -200},
      {"payer": "UNILEVER", "points": -100}
    ]
    expect(described_class.(points:300)).to eq(expected)
  end

  describe 'helper methods' do
    it 'finds all of the positive transactions' do
      spender = SpendPointsService.new
      user = User.create!(name: 'Maude Green')
      transaction2 = Transaction.create!(payer: "UNILEVER", points: 200, timestamp: "2020-10-31T11:00:00Z", user_id: user.id) 
      transaction3 = Transaction.create!(payer: "DANNON", points: -200, timestamp: "2020-10-31T15:00:00Z", user_id: user.id)

      expect(spender.transactions).to eq([transaction2])
    end
  end
end