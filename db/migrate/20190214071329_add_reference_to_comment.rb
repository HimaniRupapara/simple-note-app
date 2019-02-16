class AddReferenceToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :commented_by_id , :integer, :references => "users"
  end
end
