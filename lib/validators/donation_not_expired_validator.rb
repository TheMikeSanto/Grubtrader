class DonationNotExpiredValidator < ActiveModel::Validator
  def validate(record)
    if record.expired?
      record.errors[:base] << "Produce can not be past its shelf life when donated."
    end
  end
end