class CreateAPayments < ActiveRecord::Migration
  def change
    create_table :a_payments do |t|
      t.string :payer
      t.string :payer_account
      t.integer :payer_mfo
      t.string :recipient
      t.text :detail
      t.integer :pecipient_account
      t.string :recipient_bank
      t.integer :recipient_mfo
      t.integer :recipient_egrpou
      t.decimal :sum, :precision => 14, :scale => 2
      t.references :request, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
