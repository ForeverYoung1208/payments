class AddResourcerAaccountToBPayment < ActiveRecord::Migration
  def change
    add_reference :b_payments, :resourcer, index: true, foreign_key: true
    add_reference :b_payments, :aaccount, index: true, foreign_key: true
  end
end
