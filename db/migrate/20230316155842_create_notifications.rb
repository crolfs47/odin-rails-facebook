class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :notifiable_id
      t.string :notifiable_type

      t.timestamps
    end
  end
end
