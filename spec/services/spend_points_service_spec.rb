require 'rails_helper'

RSpec.describe SpendPointsService do
  it 'spends points and returns payer with point balance being the difference' do
    user = User.create!(name: 'Bundles Gerald')
    transaction2 = Transaction.create!(payer: "UNILEVER", points: 200, timestamp: "2020-10-31T11:00:00Z", user_id: user.id) 
    transaction3 = Transaction.create!(payer: "DANNON", points: 200, timestamp: "2020-10-31T15:00:00Z", user_id: user.id)

    expected = [
      {"payer": "UNILEVER", "points": -200},
      {"payer": "DANNON", "points": -100}
    ]
    expect(described_class.(points:300)).to eq(expected)
  end
end