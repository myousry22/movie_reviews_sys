class CreateMoviesTable < ActiveRecord::Migration[6.1]
  def change
      create_table :movies do |t|
        t.string  :name
        t.text    :description
        t.integer :year
        t.string  :director
        t.string  :actor
        t.string  :filming_location
        t.string  :country
        t.decimal :average_rating, :decimal, precision: 10, scale: 2, default: 0.0
  
        t.timestamps
      end

      add_index :movies, :average_rating
      add_index :movies, :actor
  end
end
