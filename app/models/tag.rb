class Tag < ApplicationRecord
  belongs_to :transcription
  belongs_to :page
end
