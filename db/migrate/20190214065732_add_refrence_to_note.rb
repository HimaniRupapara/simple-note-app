class AddRefrenceToNote < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :created_by_id , :integer, :references => "users"
  end
end
