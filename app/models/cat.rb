class ColorValidator < ActiveModel::Validator
  COLORS = ["blue", "orange", "green", "brown", "black", "white"]
  SEXES = ["m", "f"]

  def validate(record)
    unless COLORS.include?(record.color)
      record.errors[:color] << "Color must be in #{COLORS}"
    end
    unless SEXES.include?(record.sex)
      record.errors[:sex] << "Sex must be male or female"
    end
  end
end

class Cat < ActiveRecord::Base
  attr_accessible :birth_date, :color, :name, :sex
  validates :birth_date, :color, :name, :sex, presence: true
  validates :name, uniqueness: true
  validates_with ColorValidator

  has_many :cat_rental_requests, :dependent => :destroy

  def age
    ((Date.parse(Time.now.to_s) - birth_date)/365).to_f.floor
  end
end