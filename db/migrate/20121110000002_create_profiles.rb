class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user
      t.references :profile_type
      t.string :name

      t.timestamps
    end
    add_index :profiles, :user_id
    add_index :profiles, :profile_type_id
  end
end
