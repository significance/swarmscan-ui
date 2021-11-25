namespace :import do
  desc "import json dump file"
  task analysis3: :environment do
  	user_agents = Node.where("time > ?", DateTime.now-1.day)
  	user_agents = user_agents.sort_by{|i| i.userAgent || ""}

 	import_dates = Node.select('distinct import_time')

  	table_data = []

  	user_agents.each do |ua|
  		table_data << [ua.userAgent]
  	end

  	import_dates.sort_by{|i| i[1]}.each_with_index do |id, j|
  		puts id
  		user_agents.each_with_index do |ua, i|
	  		table_data[i][j+1] = Node.where('import_id': id[0], userAgent: ua.userAgent).count
  		end
  	end  	

  	pp table_data

  	nil
  end

end

