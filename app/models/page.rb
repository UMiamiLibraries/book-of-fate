class Page < ApplicationRecord
  has_many :tags, dependent: destroy
  has_many :resources
end
