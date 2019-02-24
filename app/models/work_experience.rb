# frozen_string_literal: true

class WorkExperience < ApplicationRecord
  belongs_to :profile
  validates :company_name, presence: true
end
