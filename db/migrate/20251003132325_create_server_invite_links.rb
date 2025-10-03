class CreateServerInviteLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :server_invite_links do |t|
      t.belongs_to :server, null: false, foreign_key: true
      t.string :uniq_id

      t.timestamps
    end
    add_index :server_invite_links, :uniq_id, unique: true
  end
end
