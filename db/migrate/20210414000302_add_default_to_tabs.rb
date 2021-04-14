class AddDefaultToTabs < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:tabs, :folder_id, from: nil, to: 1)
  end
end
