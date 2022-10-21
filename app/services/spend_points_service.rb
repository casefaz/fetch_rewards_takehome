class SpendPointsService
  # adding a colon after points makes it required (keyword argument with no default)
  def self.call(points:)
    # grab all the transactions that aren't negative (ordered by timestamp)
    # reduce (iterate) over them with a hash with default of zero payer_differences
    # for each element
      # guard against negative payer balance
      # next unless the total -  for payer is positive
      # points - balance down to: points >= 0
      # update line item with new value - which should be 0
      # subtract to payer_differences: the difference
      # break if points are 0
    payer_differences = Hash.new { |h,k,_v| h[k] = 0 }
    transactions
    # .each_with_object(payer_differences)
    .reduce(points) do |pnts, trn|
      next if negative_payer_balance(trn)
      difference = [pnts, trn.points].min
      trn.update!(points:(trn.points - difference))
      payer_differences[trn.payer] -= difference
      # binding.pry
      pnts -= difference
      break if pnts == 0
      pnts
    end
    payer_differences.map { |k,v| {payer: k, points: v}}
  end

  def self.transactions
    Transaction.where('points > 0')
  end

  def self.negative_payer_balance(transaction)
    false
  end
end