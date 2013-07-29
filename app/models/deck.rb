class Deck < ActiveRecord::Base
	has_many :cards
  belongs_to :user
  accepts_nested_attributes_for :cards, allow_destroy: true
  attr_accessible :cards_attributes
end
