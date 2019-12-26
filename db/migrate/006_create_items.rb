class CreateItems < ActiveRecord::Migration[5.2]
    def change
      create_table :items do |t|
        t.string :name
        t.integer :level
        t.string :slot
        t.belongs_to :inventory
        t.timestamps
      end
    end
  end
  