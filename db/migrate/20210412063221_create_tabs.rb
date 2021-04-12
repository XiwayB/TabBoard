class CreateTabs < ActiveRecord::Migration[6.0]
  def change
    create_table :tabs do |t|
      t.string :title
      t.string :url
      t.string :icon
      t.references :folder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
