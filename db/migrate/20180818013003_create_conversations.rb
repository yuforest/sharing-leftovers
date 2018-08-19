class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :leftover_id

      t.timestamps
    end
    add_index :conversations, :sender_id
    add_index :conversations, :recipient_id
    add_index :conversations, :leftover_id
    add_index :conversations, [:sender_id, :recipient_id, :leftover_id],
    unique: true, :name => 'conversation_index'
  end
end
