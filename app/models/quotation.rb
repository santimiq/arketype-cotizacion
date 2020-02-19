class Quotation < ApplicationRecord

  belongs_to :user
  has_many :requirements, dependent: :destroy
  has_many :phases, dependent: :destroy
  has_many :conditions, dependent: :destroy
  has_many :concepts, dependent: :destroy
  has_many :totals, dependent: :destroy
  has_many :days, dependent: :destroy
  has_many :concept_quotations, dependent: :destroy

  accepts_nested_attributes_for :requirements, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :phases, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :conditions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :concepts, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :totals, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :days, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :concept_quotations, reject_if: :all_blank, allow_destroy: true

  mount_uploader :photo, PhotoUploader

  extend FriendlyId
  # friendly_id :titulo, use: :slugged
   friendly_id :slug_candidates, use: :slugged
   def slug_candidates
    SecureRandom.uuid
   end

  validates :titulo, presence: :true
  validates :servicio, presence: :true
  validates :scope, presence: :true
  validates :fecha, presence: :true

  # def slug=(value)
  #   if value.present?
  #     write_attribute(:slug, value)
  #   end
  # end

  # def set_slug
  #   loop do
  #     self.slug = SecureRandom.uuid
  #     break unless Quotation.where(slug: slug).exists?
  #   end
  # end

end
