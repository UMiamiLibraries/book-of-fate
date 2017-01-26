class Submission < ApplicationRecord
  belongs_to :transcription
  
  self.per_page = 10

end
