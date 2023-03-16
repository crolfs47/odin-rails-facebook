class EditNotifications < ActiveRecord::Migration[7.0]
  def change
    remove_column :notifications, :notifiable_type, :string
    add_column :notifications, :type, :string
    add_column :notifications, :read, :boolean
  end
end
