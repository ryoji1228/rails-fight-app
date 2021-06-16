class Sport < ApplicationRecord
  validates :year, presence: true
  validates :month, presence: true
  validates :name1, presence: true
  validates :name2, presence: true
  validates :result, presence: true
end
