class ChangeColumnNameToNote < ActiveRecord::Migration[5.2]
  def change
    rename_column :notes, :descriptin, :description
  end
end
