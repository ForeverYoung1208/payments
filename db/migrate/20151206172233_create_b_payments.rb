class CreateBPayments < ActiveRecord::Migration
  def change
    create_table :b_payments do |t|
      t.references :b_account, index: true, foreign_key: true
      t.decimal :sum_allowed
      t.decimal :sum_rest
      t.decimal :sum
      t.string :recipient
      t.text :detail
      t.text :note
      t.references :request, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
