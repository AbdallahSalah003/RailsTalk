class CreateServerMemberships < ActiveRecord::Migration[8.0]
  def change
    create_table :server_memberships do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :server, null: false, foreign_key: true

      t.timestamps
    end
  end
end
