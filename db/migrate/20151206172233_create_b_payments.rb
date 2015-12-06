class CreateBPayments < ActiveRecord::Migration
  def change
    create_table :b_payments do |t|
      t.references :b_account, index: true, foreign_key: true
      t.decimal :sum_allowed, :precision => 14, :scale => 2
      t.decimal :sum_rest, :precision => 14, :scale => 2
      t.decimal :sum, :precision => 14, :scale => 2
      t.string :recipient
      t.text :detail
      t.text :note
      t.references :request, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
