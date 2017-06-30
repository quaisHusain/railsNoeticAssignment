class UserPayment < ActiveRecord::Base
  belongs_to :user
  attr_accessible :amount, :stripe_token, :payment_date, :user_id
end
