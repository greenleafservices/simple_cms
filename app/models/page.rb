class Page < ApplicationRecord

    belongs_to :subject, { :optional => false }
    has_many :sections
    has_and_belongs_to_many :admin_users

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("subject_id ASC, position ASC, name ASC") }
  scope :new_first, lambda { order("created_at DESC") }
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"]) }

  # validates_presence_of :name
  # validates_length_of :name, :maximum => 255
  validates :name,  :presence => true,
                    :length => ( :maximum => 25 })
  # validates_presence_of :permalink
  # validates_length_of :permalink, :within => 3..255
  # # use presence_of with length_of to disallow spaces
  # validates_uniqueness_of :permalink
  validates :permalink, :presence => true,
                        :length => { :within => 8..25}
                        :uniqueness => true

end
