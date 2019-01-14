# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user
  has_many :work_experiences
  accepts_nested_attributes_for :work_experiences, reject_if: :all_blank, allow_destroy: true
end
