class AddAmountToNote < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :amount, :integer, :default => 50
  end
end
