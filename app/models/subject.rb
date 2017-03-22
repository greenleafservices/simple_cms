class Subject < ApplicationRecord

  acts_as_list

  has_many :pages

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("name ASC") }
  scope :new_first, lambda { order("created_at DESC") }
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"]) }

  # validates_presence_of :name
  # validates_length_of :name, :maximum => 255
  validates :name, :presence => true,
                    :length => { :maximum => 25 }
end
