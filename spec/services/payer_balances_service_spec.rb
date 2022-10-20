require 'rails_helper'

RSpec.describe PayerBalancesService do
  describe '.call/0' do
    # let(:transaction_mock) {class_double(Transaction)}
    it 'returns the balances for each payer' do
      # pre subtraction
      user = User.create!(name: 'Bundles Gerald')
      transaction1 = Transaction.create!(payer: "DANNON", points: 1000, timestamp: "2020-11-02T14:00:00Z", user_id: user.id) 
      transaction2 = Transaction.create!(payer: "UNILEVER", points: 200, timestamp: "2020-10-31T11:00:00Z", user_id: user.id) 
      transaction3 = Transaction.create!(payer: "DANNON", points: -200, timestamp: "2020-10-31T15:00:00Z", user_id: user.id) 
      transaction4 = Transaction.create!(payer: "MILLER COORS", points: 10000, timestamp: "2020-11-01T14:00:00Z", user_id: user.id)
      transaction5 = Transaction.create!(payer: "DANNON", points: 300, timestamp: "2020-10-31T10:00:00Z", user_id: user.id)

      # expect(transaction_mock).to receive(:group).with(:payer).and_return(Transaction.all.group_by(&:payer))
      expect(described_class.call).to eq({"UNILEVER"=>200, "MILLER COORS"=>10000, "DANNON"=>1100})
    end
  end
end