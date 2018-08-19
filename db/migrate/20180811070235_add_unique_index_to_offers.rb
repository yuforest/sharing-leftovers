class AddUniqueIndexToOffers < ActiveRecord::Migration[5.2]
  def change
    add_index :offers, [:user_id, :leftover_id], :unique => true
  end
end
