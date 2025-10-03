class CreateChannelMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :channel_messages do |t|
      t.text :body
      t.belongs_to :server_channel, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
