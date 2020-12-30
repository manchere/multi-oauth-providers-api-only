class AddIndexToUserId < ActiveRecord::Migration[6.0]
  def change
    add_index :identities, :user_id
  end
end
