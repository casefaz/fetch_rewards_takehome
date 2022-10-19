class TransactionSerializer
  include JSONAPI::Serializer
  attributes :payer, :points, :created_at, :user_id
end
