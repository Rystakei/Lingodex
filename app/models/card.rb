class Card < ActiveRecord::Base
	belongs_to :deck

	def as_json(options={})
		super only: [:id, :term, :definition]
	end
end
