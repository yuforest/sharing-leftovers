class AddImageToLeftovers < ActiveRecord::Migration[5.2]
  def change
    add_column :leftovers, :image, :text
  end
end
