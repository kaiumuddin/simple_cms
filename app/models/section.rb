class Section < ApplicationRecord

  belongs_to :page
  has_many :section_edits
  has_many :admin_users, :through => :section_edits


  CONTENT_TYPES = ['text', 'HTML']

  validates :name, presence: true, length: { maximum: 255 }
  validates :content_type, inclusion: { in: CONTENT_TYPES, message: CONTENT_TYPES.join(', ').to_s }
  validates :content, presence: true
end
