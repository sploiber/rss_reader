class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.references :profile
      t.string :title, :null => false
      t.string :url, :null => false

      t.timestamps
    end
    add_index :channels, :profile_id
  end
end
