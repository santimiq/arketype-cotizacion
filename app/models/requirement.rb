class Requirement < ApplicationRecord
  belongs_to :quotation
  has_many :sub_requirements, dependent: :destroy
  has_many :icons, dependent: :destroy
  accepts_nested_attributes_for :sub_requirements, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :icons, reject_if: :all_blank, allow_destroy: true

  def icon
    Icon.new(icon_name)
  end
end
