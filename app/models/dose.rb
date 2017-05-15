class Dose < ApplicationRecord
  belongs_to :ingredient, -> { order(name: :asc)}
  belongs_to :cocktail

  validates_uniqueness_of :cocktail, :scope => :ingredient
end
