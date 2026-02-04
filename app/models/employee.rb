class Employee < ApplicationRecord
  belongs_to :department
	validates :department, presence: true
end
