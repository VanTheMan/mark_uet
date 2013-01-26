namespace :db do
  desc "Crawl marks"
  task update: :environment do
    categories = ["INT", "MAT", "PHY"]
    categories.each do |category|
      Crawl.new.crawl_results(category)
    end
    unknowns = ["INT 3011", "INT 3066", "INT 3093","INT 3056", "INT 3061"]
    unknowns.each do |u|
      if m = Mark.where(code: u).first
        if (Time.now - m.uploaded_at) < 10.minutes
          UserMailer.notice(m).deliver
        end
      end
    end
  end
end