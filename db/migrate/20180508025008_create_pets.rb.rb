class CreatePets < ActiveRecord::Migration[5.2]

  def change
    create_table :pets do |t|
      t.string :name
      t.string :gender
      t.date :birthday
      t.string :fed
      t.string :walk
      t.string :dog_friendly
      t.text :vet
      t.text :add_notes
      t.integer :user_id
    end
  end
end
