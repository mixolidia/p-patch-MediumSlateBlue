class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :name
      t.datetime :starts_at

      t.timestamps
    end
  end
end
