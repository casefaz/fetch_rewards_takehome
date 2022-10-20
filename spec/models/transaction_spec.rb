require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validations' do
    it { should validate_presence_of :payer }
    it { should validate_presence_of :points }
    it { should validate_presence_of :timestamp }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end

  describe 'class methods' do
    it 'sorts the entries by the timestamp' do
      user = User.create!(name: 'Bundles Gerald')
      transaction1 = Transaction.create!(payer: "DANNON", points: 1000, timestamp: "2020-11-02T14:00:00Z", user_id: user.id) 
      transaction2 = Transaction.create!(payer: "UNILEVER", points: 200, timestamp: "2020-10-31T11:00:00Z", user_id: user.id) 
      transaction3 = Transaction.create!(payer: "DANNON", points: -200, timestamp: "2020-10-31T15:00:00Z", user_id: user.id) 
      transaction4 = Transaction.create!(payer: "MILLER COORS", points: 10000, timestamp: "2020-11-01T14:00:00Z", user_id: user.id) 
      transaction5 = Transaction.create!(payer: "DANNON", points: 300, timestamp: "2020-10-31T10:00:00Z", user_id: user.id)

      expect(Transaction.sort_by_date).to eq([transaction5, transaction2, transaction3, transaction4, transaction1])
    end

    xit 'spends points' do
      # call the sort method
      # for each day starting with the oldest day (ascending)
        # group points by payer and add them together
        # until the sum of the points == 5000 iterate through and set to 0
        # set new values for payer points based on the point sum
        # return should be each transaction with amount subtracted, if applicable

        expect(Transaction.spend_points).to eq()
    end

    it 'finds the point balances' do
      user = User.create!(name: 'Bundles Gerald')
      transaction1 = Transaction.create!(payer: "DANNON", points: 1000, timestamp: "2020-11-02T14:00:00Z", user_id: user.id) 
      transaction2 = Transaction.create!(payer: "UNILEVER", points: 200, timestamp: "2020-10-31T11:00:00Z", user_id: user.id) 
      transaction3 = Transaction.create!(payer: "DANNON", points: -200, timestamp: "2020-10-31T15:00:00Z", user_id: user.id) 
      transaction4 = Transaction.create!(payer: "MILLER COORS", points: 10000, timestamp: "2020-11-01T14:00:00Z", user_id: user.id) 
      transaction5 = Transaction.create!(payer: "DANNON", points: 300, timestamp: "2020-10-31T10:00:00Z", user_id: user.id)

      expect(Transaction.points_balance).to eq({"UNILEVER"=>200, "MILLER COORS"=>10000, "DANNON"=>1100})
    end
  end
end
