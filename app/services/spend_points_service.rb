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
      # add to payer_differences: the difference
      # break if points are 0
    transactions
    .each_with_object(payer_differences)
    .reduce(points) do |pnts, (trn, differences)|
      next if negative_payer_balance(trn)
      difference = if pnts >= trn.points 
        trn.points
      else
        pnts
      end
      break if pnts == 0
    end
  end

  def transactions
    # finds all positive transactions
    Transaction.where('points > 0')
  end

  def payer_differences
    # default proc that says we aren't using v
    Hash.new { |h,k,_v| h[k] = 0 }
  end

  def negative_payer_balance(transaction)
    false
  end
end