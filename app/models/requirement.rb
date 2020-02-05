class Requirement < ApplicationRecord
  belongs_to :quotation
  has_many :sub_requirements, dependent: :destroy
  accepts_nested_attributes_for :sub_requirements, reject_if: :all_blank, allow_destroy: true
end
