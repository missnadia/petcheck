class CreatePets.rb < ActiveRecord::Migration[5.2]

  def change
    create_table :pets do |t|
      t.string :name
      t.date :birthday
      t.boolean :fed
      t.boolean :walk
      t.boolean :dog_friendly
      t.string :vet
      t.text :add_notes
      t.integer :user_id
    end
  end
end
