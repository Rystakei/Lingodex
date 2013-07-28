class AddDeckstoUser < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.references :decks
    end
  end

  def down
  end
end
