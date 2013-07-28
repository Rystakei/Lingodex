class AddUsertoDeck < ActiveRecord::Migration
  def up
      change_table :decks do |t|
        t.belongs_to :user
    end
  end

  def down
  end
end
