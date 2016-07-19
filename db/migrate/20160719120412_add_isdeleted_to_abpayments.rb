class AddIsdeletedToAbpayments < ActiveRecord::Migration
  def change
	  change_table :a_payments do |t|
	    t.boolean :is_deleted, default: false
	  end
	  change_table :b_payments do |t|
    	t.boolean :is_deleted, default: false
	  end
	end
  
end
