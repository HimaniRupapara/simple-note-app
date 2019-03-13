class AddColumnInNote < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :chargeID, :text
  end
end
