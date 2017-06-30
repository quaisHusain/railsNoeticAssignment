class CreateUserPayments < ActiveRecord::Migration
  def change
    create_table :user_payments do |t|

      t.float :amount
      t.string :stripe_token
      t.references :user, index: true
      t.string :payment_date
      t.string :datetime

      t.timestamps
    end
  end
end
