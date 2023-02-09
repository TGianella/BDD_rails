class City < ApplicationRecord
  has_many :dogsitters
  has_many :strolls
  has_many :dogs
end
