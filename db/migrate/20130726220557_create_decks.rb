class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name
      t.string :subject
      t.references :cards
      t.integer :times_reviewed
      t.string :results

      t.timestamps
    end
  end
end
