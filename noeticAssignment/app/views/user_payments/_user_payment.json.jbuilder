json.extract! user_payment, :amount, :stripe_token, :user_id, :payment_date, :created_at, :updated_at
json.url user_payment_url(user_payment, format: :json)
