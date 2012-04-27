class PhoneNumberLegitValidator < ActiveModel::Validator 
	def validate(record)
		phone = record.phone.gsub(/\D/, '')
		if phone.length < 10
			record.errors[:phone] << "number must be 10 digits"
		end
	end
end