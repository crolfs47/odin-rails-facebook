class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :date
      t.datetime :start_time
      t.datetime :end_time
      t.text :details
      t.references :host, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
