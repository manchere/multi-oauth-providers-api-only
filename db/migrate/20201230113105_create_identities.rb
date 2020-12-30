class CreateIdentities < ActiveRecord::Migration[6.0]
  def change
    create_table :identities, id: :uuid do |t|
      t.string :uid
      t.string :provider

      t.timestamps
    end
  end
end
