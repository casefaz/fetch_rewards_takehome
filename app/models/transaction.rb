class Transaction < ApplicationRecord
  belongs_to :user
  validates_presence_of :payer
  validates_presence_of :points
  validates_presence_of :timestamp

  def self.sort_by_date
    # binding.pry
    order(:timestamp)
  end
end
