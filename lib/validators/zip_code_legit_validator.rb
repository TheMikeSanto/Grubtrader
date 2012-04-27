class ZipCodeLegitValidator < ActiveModel::Validator 
	def validate(record)
		zip = record.zip.gsub(/\D/, '')
		if zip.length < 6
			record.errors[:zip] << "code must be 5 digits"
		end
	end
end