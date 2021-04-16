class AddReferencesToShare < ActiveRecord::Migration[6.0]
  def change
    add_reference :shares, :user_id, foreign_key: true
    add_reference :shares, :folder, foreign_key: true

  end
end
