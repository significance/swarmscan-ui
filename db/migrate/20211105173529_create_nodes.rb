class CreateNodes < ActiveRecord::Migration[6.1]
  def change
    create_table :nodes do |t|
      t.datetime :import_time
      t.string :import_id
      t.string :overlay
      t.string :error
      t.boolean :fullNode
      t.string :country
      t.float :lat
      t.float :long
      t.datetime :lastDiscoveryTime
      t.datetime :lastCheckTime
      t.boolean :seen_in_last_hour
      t.boolean :checked_in_last_hour
      t.integer :underlays
      t.string :last_underlay
      t.string :userAgent
      t.string :ethereumAddress

      t.timestamps
    end
  end
end
