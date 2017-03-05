class AdminUser < ApplicationRecord

  has_and_belongs_to_many :pages

  scope :new_first, lambda { order("created_at DESC") }
end
