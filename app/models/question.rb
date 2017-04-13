class Question < ApplicationRecord
	has_many :transcriptions

	def status
		if ENV["BOF_MODE"] != "CROWD_SOURCE" then
			return "Frozen"
		elsif self.locked then
			return "Unfreeze"
		else
			return "Freeze"
		end
	end

	def submissions_allowed?
		if ENV["BOF_MODE"] == "CROWD_SOURCE"  && !self.locked then
			return true
		end
		return false
	end

	def toggle
		if ENV["BOF_MODE"] == "CROWD_SOURCE" then
			self.locked = !self.locked
		end
	end
end
