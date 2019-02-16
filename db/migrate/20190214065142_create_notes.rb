class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :descriptin
      t.boolean :active
      t.boolean :important
      t.timestamps
    end
  end
end
