class Section < ApplicationRecord

  belongs_to :page
  has_many :section_edits
  has_many :admin_users, through: :section_edits

  scope :visible, -> { where(visible: true) }
  scope :invisible, -> { where(visible: false) }
  scope :sorted, -> { order('position ASC') }
  scope :newest_first, -> { order('created_at DESC') }

  CONTENT_TYPES = %w[text HTML].freeze

  validates :name, presence: true, length: { maximum: 255 }
  validates :content_type, inclusion: { in: CONTENT_TYPES, message: "must be one of: #{CONTENT_TYPES.join(', ')}" }
  validates :content, presence: true
end
