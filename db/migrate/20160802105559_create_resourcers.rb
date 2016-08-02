class CreateResourcers < ActiveRecord::Migration
  def change
    create_table :resourcers do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
