class AddTimestampToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :timestamp, :timestamp
  end
end
