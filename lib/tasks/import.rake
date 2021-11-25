require 'net/http'

namespace :import do
  desc "import json dump file"
  task jsondump: :environment do
  

    source = HTTParty.get('https://swarmscan-api.resenje.org/v1/network/dump').body

    import_time = DateTime.now
    import_id = Digest::MD5.hexdigest source

    obj = JSON.parse(source)
    c = obj["nodes"].count
    obj["nodes"].each_with_index do |n,i|

      puts "#{i+1}/#{c}"

      o = n["overlay"]
      dt = n["lastDiscoveryTime"].gsub(/\..+$/,"")
      ct = n["lastCheckTime"].gsub(/\..+$/,"")


      if dt.to_datetime >= DateTime.now - 1.hour
        seen_in_last_hour = true
      else
        seen_in_last_hour = false
      end

      if dt.to_datetime >= DateTime.now - 1.hour
        checked_in_last_hour = true
      else
        checked_in_last_hour = false
      end

      args = {
        import_id: import_id,
        import_time: import_time,
        overlay: o,
        lastDiscoveryTime: dt,
        lastCheckTime: ct,
        error: n["error"],
        fullNode: n["fullNode"],
        underlays: n["underlays"].count,
        last_underlay: n["underlays"].last,
        ethereumAddress: n["ethereumAddress"],
        seen_in_last_hour: seen_in_last_hour,
        checked_in_last_hour: checked_in_last_hour
      }

      if n["location"]
        args2 = {
          country: n["location"]["country"],
          lat: n["location"]["latitude"],
          long: n["location"]["longitude"],
        }
        args.merge!(args2)
      end

      if n["userAgent"]
        args3 = {
          userAgent: n["userAgent"]
        }
        args.merge!(args3)
      end

      puts args

      nn = Node.create(args)


    end
  end

end
