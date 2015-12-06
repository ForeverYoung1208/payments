class CreateBAccounts < ActiveRecord::Migration
  def change
    create_table :b_accounts do |t|
      t.string :number
      t.string :name
      t.decimal :plan, :precision => 14, :scale => 2
      t.decimal :fact, :precision => 14, :scale => 2

      t.timestamps null: false
    end
  end
end