class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :age, numericality: { greater_than: 0 }

  before_save :capitalize_name

  private

  def capitalize_name
    self.name = name.capitalize
  end
end
