class ChangeToolsColumnName < ActiveRecord::Migration
  def change
    rename_column :tools, :borrower, :user_id
  end
end
