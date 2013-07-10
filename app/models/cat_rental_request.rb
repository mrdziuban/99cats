class DateValidator < ActiveModel::Validator
  def validate(record)
    crrs = CatRentalRequest.find_all_by_cat_id(record.cat_id)
    crrs.each do |crr|
      if (record.begin_date < crr.end_date && record.end_date > crr.begin_date) &&
        crr.status == "approved"
        record.errors[:begin_date] << "Cannot have overlapping dates"
      end
    end
  end
end

class CatRentalRequest < ActiveRecord::Base
  attr_accessible :cat_id, :begin_date, :end_date
  validates_with DateValidator

  belongs_to :cat

  def approve
    status = "approved"

    crrs = CatRentalRequest.find_all_by_cat_id(cat_id)
    crrs.each do |crr|
      if begin_date < crr.end_date && end_date > crr.begin_date
        crr.status = "denied"
        crr.save
      end
    end
  end

  def deny
    status = "denied"
  end
end