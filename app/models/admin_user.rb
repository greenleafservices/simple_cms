class Admin_User < ApplicationRecord
  scope :new_first, lambda { order("created_at DESC") }
end
