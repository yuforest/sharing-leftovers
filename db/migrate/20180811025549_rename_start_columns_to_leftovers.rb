class RenameStartColumnsToLeftovers < ActiveRecord::Migration[5.2]
  def change
    rename_column :leftovers, :start, :start_on
    rename_column :leftovers, :end, :end_on
  end
end
