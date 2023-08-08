class RemoveStatusFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :status, :string
  end
end
