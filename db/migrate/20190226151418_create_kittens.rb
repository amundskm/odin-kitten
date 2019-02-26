class CreateKittens < ActiveRecord::Migration[5.2]
  def change
    create_table :kittens do |t|
      t.text :name
      t.integer :age
      t.text :cuteness
      t.text :softness
      t.timestamps
    end
  end
end
