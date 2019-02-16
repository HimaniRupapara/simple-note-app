class CreateSharedNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :shared_notes do |t|
      t.string :email
      t.references :note, foreign_key: true
      t.references :permission, foreign_key: true

      t.timestamps
    end
  end
end
