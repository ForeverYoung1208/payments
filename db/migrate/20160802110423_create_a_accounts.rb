class CreateAAccounts < ActiveRecord::Migration
  def change
    create_table :aaccounts do |t|
      t.string :number
      t.string :company_name
      t.string :code

      t.timestamps null: false
    end
  end
end
