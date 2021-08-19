class Tag < ApplicationRecord
  has_many :plant_tags, dependent: :destroy
  has_many :tags, through: :plant_tags
end
