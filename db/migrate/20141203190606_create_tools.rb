class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.integer :user_id
      t.boolean :available
      t.datetime :due_date

      t.timestamps
    end
  end
end
