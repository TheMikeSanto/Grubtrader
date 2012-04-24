namespace :inventory do
	namespace :check do
		desc 'Run through all non-expired donations and mark them as expired if past expires_at'
		task :expired => :environment do
			DonationLine.unexpired.each do |line|
				if line.expired?
					puts "Updating expired donation line:"
					puts "Donation Line: #{line.id}"
					puts "Donation ID: #{line.donation.id}"
					puts "Expired at: #{line.expires_at} (today is #{Date.today})"
					line.update_attributes(expired: true)
				end
			end
		end
	end
end