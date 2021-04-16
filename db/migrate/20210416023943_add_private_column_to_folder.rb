class AddPrivateColumnToFolder < ActiveRecord::Migration[6.0]
  def change
    add_column :folders, :is_private, :boolean, default: true
  end
end
