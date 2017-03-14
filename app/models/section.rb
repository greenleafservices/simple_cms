class Section < ApplicationRecord

  belongs_to :page
  has_many :section_edits
  has_many :admin_users, :through => :section_edits

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("page_id ASC, position ASC, name ASC") }
  scope :new_first, lambda { order("created_at DESC") }
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"]) }

  CONTENT_TYPES = ['Text', 'HTML']

  # validates_presence_of :name
  # validates_length_of :name, :maximum => 255
  validates :name,  :presence => true,
                    :length => { :maximum => 25 }
  validates_inclusion_of :content_type, :in => CONTENT_TYPES,
    :message => "must be one of: #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content




end
