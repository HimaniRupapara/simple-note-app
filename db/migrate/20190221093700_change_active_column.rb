class ChangeActiveColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :notes, :active, :boolean, :default => true
  end
end
