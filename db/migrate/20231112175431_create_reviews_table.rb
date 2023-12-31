class CreateReviewsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.string :review
      t.string :user
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
