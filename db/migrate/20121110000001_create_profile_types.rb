class CreateProfileTypes < ActiveRecord::Migration
  def change
    create_table :profile_types do |t|
      t.string :name, :limit => 10, :unique => true
      t.integer :num_channels

      t.timestamps
    end
  end
end
