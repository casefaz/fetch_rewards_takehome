class Transaction < ApplicationRecord
  belongs_to :user
  validates_presence_of :payer
  validates_presence_of :points
end
