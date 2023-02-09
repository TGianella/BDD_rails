class Stroll < ApplicationRecord
  belongs_to :dogsitter
  belongs_to :city
  has_and_belongs_to_many :dogs
end
