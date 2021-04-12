class RemoveImportanceToFolders < ActiveRecord::Migration[6.0]
  def change
    remove_column :folders, :importance, :string
  end
end
