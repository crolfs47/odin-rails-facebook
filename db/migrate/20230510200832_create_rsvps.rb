class CreateRsvps < ActiveRecord::Migration[7.0]
  def change
    create_table :rsvps do |t|
      t.references :attendee, null: false, foreign_key: { to_table: :users }
      t.references :event, null: false, foreign_key: { to_table: :events }

      t.timestamps
    end
  end
end