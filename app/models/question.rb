class Question < ApplicationRecord
	has_many :transcriptions

	def status
		if self.locked then
			return "Unfreeze"
		else
			return "Freeze"
		end
	end

	def toggle
		if self.locked then
			self.locked = false
		else
			self.locked = true
		end
	end
end
