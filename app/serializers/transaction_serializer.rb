class TransactionSerializer
  include JSONAPI::Serializer
  attributes :payer, :points, :timestamp, :user_id
end
