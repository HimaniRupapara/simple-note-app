class AddrefereneceToSharedNote < ActiveRecord::Migration[5.2]
  def change
    add_column :shared_notes, :shared_by_id , :integer, :references => "users"
  end
end
