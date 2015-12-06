class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.date :date
      t.references :project, index: true, foreign_key: true
      t.boolean :is_approved

      t.timestamps null: false
    end
  end
end
