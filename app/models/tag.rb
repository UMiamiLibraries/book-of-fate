class Tag < ApplicationRecord
  belongs_to :transcription
  belongs_to :page

  validates_uniqueness_of :page_id, scope: :transcription_id
end
