class PayerBalancesService
  def self.call
    Transaction.group(:payer).sum(:points)
  end
end