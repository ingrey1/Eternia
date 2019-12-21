class CreateUsers > ActiveRecord::Migration

    def change
      create_table :users do |t|
        t.string :name
        t.belongs_to :game
        t.timestamps
      end 
    end 

end 