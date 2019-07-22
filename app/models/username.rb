class Username < ApplicationRecord
  has_secure_password
  validates :name, uniqueness: { case_sensitive: false }


end
