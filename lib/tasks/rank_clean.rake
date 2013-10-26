require 'open-uri'

namespace :db do
	namespace :clean do

		desc "Destory ranks that don't have any associated rankings"
		task ranks: :environment do
			
		end

		desc "Destroy rankings that don't have any associated ranks"
		task rankings: :environment do

		end

	end
end
