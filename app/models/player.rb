class Player < ApplicationRecord
  belongs_to :team
  
  validates :name, presence: true
  validates :position, presence: true
  
  def display_name
    "#{name} (#{position})"
  end
end
