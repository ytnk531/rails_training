# frozen_string_literal: true

class User < ApplicationRecord
  before_save do
    self.email_address = email_address.downcase
    self.role ||= :user
  end
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email_address, presence: true, length: {maximum: 255},
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  has_secure_password
  has_one :profile
  enum role: { user: "USER", admin: "ADMIN" }

  def is_allowed_new_user?
    self.role == "admin"
  end

  def is_allowed_delete_user?
    self.role == "admin"
  end
end
