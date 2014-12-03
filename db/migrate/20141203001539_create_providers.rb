class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :uid
      t.string :user_name

      t.timestamps
    end
  end
end
