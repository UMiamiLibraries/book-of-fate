class Page < ApplicationRecord
  has_many :tags
  has_many :resources
end
