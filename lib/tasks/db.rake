namespace :db do
  desc "Crawl marks"
  task update: :environment do
    categories = ["INT", "MAT", "PHY"]
    categories.each do |category|
      Crawl.new.crawl_results(category)
    end
    UserMailer.notification.deliver
  end
end