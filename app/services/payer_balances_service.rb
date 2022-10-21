class PayerBalancesService
  # takes into account dependency injection
  # **args == nothing - controller passes nothing down

  def self.call(**args)
    new(**args).call
  end

  attr_reader :transactions
  
  def initialize(transactions: Transaction)
    @transactions = transactions
  end

  def call
    @transactions.group(:payer).sum(:points)
  end
end