class AddImportanceToFolders < ActiveRecord::Migration[6.0]
  def change
    add_column :folders, :importance, :boolean, default: false
  end
end
