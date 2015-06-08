require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '1s' do
  if (true)
  	puts Time.now.strftime("%H:%M:%S")
  end
end

scheduler.join
