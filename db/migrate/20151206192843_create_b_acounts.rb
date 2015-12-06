class CreateBAcounts < ActiveRecord::Migration
  def change
    create_table :b_acounts do |t|
      t.string :number
      t.string :name
      t.decimal :plan
      t.decimal :fact

      t.timestamps null: false
    end
  end
end
