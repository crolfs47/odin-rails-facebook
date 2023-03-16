class ChangeColumnInNotifications < ActiveRecord::Migration[7.0]
  def change
    remove_column :notifications, :type, :string
    add_column :notifications, :action, :string
  end
end
