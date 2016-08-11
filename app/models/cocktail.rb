class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, :through => :doses, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates_associated :doses

end
