class CreateLeftovers < ActiveRecord::Migration[5.2]
  def change
    create_table :leftovers do |t|
      t.string :title
      t.text :content
      t.string :address
      t.float :latitude
      t.float :longitude
      t.date :start
      t.date :end
      t.references :user, foreign_key: true
      t.boolean :expired
      t.timestamps
    end
  end
end
