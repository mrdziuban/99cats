class DateValidator < ActiveModel::Validator
  def validate(record)
    CatRentalRequest.find_all_by_cat_id(record.cat_id)
  end
end

class CatRentalRequest < ActiveRecord::Base
  attr_accessible :cat_id, :begin_date, :end_date
  validates_with DateValidator

  belongs_to :cat
end