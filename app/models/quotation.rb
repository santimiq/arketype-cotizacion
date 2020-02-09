class Quotation < ApplicationRecord

  def set_slug
    loop do
      self.slug = SecureRandom.uuid
      break unless Quotation.where(slug: slug).exists?
    end

  end
  belongs_to :user
  has_many :requirements, dependent: :destroy
  has_many :phases, dependent: :destroy
  has_many :conditions, dependent: :destroy
  has_many :concepts, dependent: :destroy
  has_many :totals, dependent: :destroy
  has_many :days, dependent: :destroy
  accepts_nested_attributes_for :requirements, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :phases, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :conditions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :concepts, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :totals, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :days, reject_if: :all_blank, allow_destroy: true
  mount_uploader :photo, PhotoUploader

  extend FriendlyId
  friendly_id :titulo, use: :slugged

  validates :titulo, presence: :true
  validates :servicio, presence: :true
  validates :scope, presence: :true
  validates :fecha, presence: :true
end
