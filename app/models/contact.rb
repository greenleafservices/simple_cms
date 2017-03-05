class Contact < ApplicationRecord

  scope :new_first, lambda { order("created_at DESC") }
  scope :search, lambda {|query| where(["last_name LIKE ?", "%#{query}%"]) }
end
