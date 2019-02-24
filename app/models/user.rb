# frozen_string_literal: true

class User < ApplicationRecord
  before_save do
    self.email_address = email_address.downcase
    self.role ||= :user
  end
  validates :name, presence: true
  validates :email_address, presence: true, length: {maximum: 255},
            format: { with: URI::MailTo::EMAIL_REGEXP },
            uniqueness: { case_sensitive: false }

  has_secure_password
  has_one :profile
  enum role: { user: 'USER', admin: 'ADMIN' }

  def is_allowed_new_user?
    self.role == 'admin'
  end

  def is_allowed_delete_user?
    self.role == 'admin'
  end
end
