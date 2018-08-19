class AddCategoryIdToLeftovers < ActiveRecord::Migration[5.2]
  def change
    add_column :leftovers, :category_id, :integer
    add_index(:leftovers, :category_id)
  end
end
