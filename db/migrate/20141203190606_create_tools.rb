class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.integer :borrower
      t.boolean :available
      t.datetime :due_date

      t.timestamps
    end
  end
end
