class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text   :ingredients
      t.text   :directions
      t.text   :story
      t.integer :cook_time
      t.integer :prep_time
      t.string  :diet
      t.string  :category
      t.string :user_id
      t.timestamps
    end
  end
end
