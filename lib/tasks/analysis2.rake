namespace :import do
  desc "import json dump file"
  task analysis2: :environment do
  	import_dates = []
	Node.select('distinct import_id').each do |x|  
		import_dates << [x.import_id, Node.all.where(import_id: x.import_id).maximum(:created_at)]
	end
	import_dates.sort_by{|i| i[1]}.each do |d|
		counts = Node.all.group('userAgent').where('import_id':d[0]).count
		table_data = []
		counts.each do |ua, c|
			table_data << {user_agent: ua.to_s, count: c}
		end


		puts ""
		puts d[1]

		puts ""
		tp table_data
	end
  end

end

