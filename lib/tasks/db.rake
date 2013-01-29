namespace :db do
  desc "Crawl marks"
  task update: :environment do
    categories = ["INT", "MAT", "PHY"]
    if Crawl.check_uet
      categories.each do |category|
        Crawl.new.crawl_results(category, false)
      end
    else
      puts "Die"
    end
    Mark.find_unknowns
  end

  task crawl_all: :environment do
    categories = ["INT", "MAT", "PHY"]
    if Crawl.check_uet
      categories.each do |category|
        Crawl.new.crawl_results(category, false)
      end
    else
      puts "Die"
    end
    Mark.find_unknowns
  end
end