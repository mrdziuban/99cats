class ColorValidator < ActiveModel::Validator
  COLORS = ["blue", "orange", "green", "brown", "black", "white"]

  def validate(record)

    unless COLORS.include?(record.color)
      record.errors[:color] << "Color must be in #{colors}"
    end
  end
end

class Cat < ActiveRecord::Base
  attr_accessible :birth_date, :color, :name, :sex
  validates :birth_date, :color, :name, :sex, presence: true
  validates :name, uniqueness: true
  validates_with ColorValidator
end