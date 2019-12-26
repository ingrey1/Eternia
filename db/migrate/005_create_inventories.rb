class CreateInventories < ActiveRecord::Migration[5.2]
    def change
      create_table :inventories do |t|
        t.string :name
        t.belongs_to :character
        t.belongs_to :monster
        t.timestamps
      end
    end
  end
  