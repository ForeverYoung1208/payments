class AddIsdsletedToRequests < ActiveRecord::Migration
  def change
	  change_table :requests do |t|
	    t.boolean :is_deleted, default: false
	  end  	
  end
end
