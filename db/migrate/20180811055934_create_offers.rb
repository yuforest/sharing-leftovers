class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.references :user, foreign_key: true
      t.references :leftover, foreign_key: true
      t.timestamps
    end
  end
end
