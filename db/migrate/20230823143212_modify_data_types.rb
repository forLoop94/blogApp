class ModifyDataTypes < ActiveRecord::Migration[7.0]
  def change
    change_column(:users, :photo, :text)
    change_column(:users, :bio, :text)
  end
end
