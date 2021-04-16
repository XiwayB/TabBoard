class AddReferencesToShare < ActiveRecord::Migration[6.0]
  def change
    add_reference :shares, :user, foreign_key: true
    add_reference :shares, :folder, foreign_key: true

  end
end
