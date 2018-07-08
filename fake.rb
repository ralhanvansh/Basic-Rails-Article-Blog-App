#def multiple_entries
#  10.times do
#    article = Article.new(title: "sbsfbssbsb", text: "sgsbdsbsd", user_id: 1)
#    article.save
#  end
#end

#multiple_entries


def find_retries
  rs = Sidekiq::RetrySet.new
  if rs.size > 10 #must be less than 1000
    puts "Number of retires are #{rs.size}"
  end

  filters = []
  rs.each do |job|
    case 
      when YAML.load(job.value)["wrapped"].include? "letter"
        filters << job
      when YAML.load(job.value)["wrapped"].include? "Emailer"
        puts "Emailer"
      when YAML.load(job.value)["wrapped"].include? "deliver_"
        puts "deliver_"
      when YAML.load(job.value)["wrapped"].include? "spreader"
        puts "spreader"
      when YAML.load(job.value)["wrapped"].include? "Couldn't Find"
        puts "Couldn't Find"
      when YAML.load(job.value)["wrapped"].include? "JMTA"
        puts "JMTA"
    end
  end
end

find_retries
