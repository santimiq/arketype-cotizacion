class Icon < ApplicationRecord
  belongs_to :requirement

  AVAILABLE_ICONS = %w[user-friends list cog]

  attr_reader :value
  def initialize(value)
    @value = value
  end

  def to_s
    "<i class='fa fa-#{@value}'></i>".html_safe
  end

  def self.all
    AVAILABLE_ICONS.map do |value|
      new(value)
    end
  end

  def self.collection
    AVAILABLE_ICONS.map do |value|
      icon = new(value)
      [icon.to_s, icon.value]
    end
  end
end
