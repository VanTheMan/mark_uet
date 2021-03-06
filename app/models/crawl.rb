require 'open-uri'

class Crawl
  def self.check_uet
    url = "http://www.coltech.vnu.edu.vn/news4st/test.php"
    begin
      open(url)
    rescue Exception => e
      puts "Couldn't read \"#{ url }\": #{ e }"
      return false
    end
  end

  def crawl_subjects(category)
    url = "http://www.coltech.vnu.edu.vn/news4st/test.php"
    subjects = {}
    doc = Nokogiri.HTML(open(url))
    doc.css("option").each do |element|
      name = element.text
      value = element.attr("value")
      if category == "Other"
        subjects[name] = value
      end
      if element.text =~ /^(#{category})/
        subjects[name] = value
      end
    end
    subjects
  end

  def filter_subjects_not_crawl(subjects)
    subjects.each do |subject|
      if Mark.where(code: subject[0]).first
        subjects.delete subject[0]
      end
    end
    subjects
  end

  def crawl_results(category, all)
    subjects = crawl_subjects(category)
    if all == false
      subjects = filter_subjects_not_crawl(subjects)
    end

    conn = Faraday.new(:url => 'http://www.coltech.vnu.edu.vn') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    subjects.each do |subject|
      response = conn.post '/news4st/test.php', { 'lstClass'=> subject[1] }
      res = Nokogiri.HTML(response.body)
      unless res.css("a").blank?
        res.css("a").each do |element|
          href = element.attr("href")
          link = "http://www.coltech.vnu.edu.vn/" + href.slice!(3..href.length)
          title = element.text
          date = title.match(/\d{2}\/\d{2}\/\d{4}/)
          time = title.match(/\d{2}\:\d{2}/)
          uploaded_at = (date.to_s + " " + time.to_s).to_time
          attribute = {
            code: subject[0],
            title: title,
            link: link,
            uploaded_at: uploaded_at,
            category: category
          }
          Mark.find_or_create(attribute)
        end
      end
    end
  end

  def self.crawl_subjects_by_semester
    url = "http://112.137.129.115/tkb/listbylist.php"
    doc = Nokogiri.HTML(open(url))

    codes = []
    names = []

    doc.css("form").each do |s|
      unless s.css("td:nth-child(2)").nil?
        s.css("td:nth-child(2)").each do |e|
          codes << e.text unless e.text.blank?
        end
        s.css("td:nth-child(3)").each do |e|
          names << e.text
        end
      end
    end

    codes.each_with_index do |code, index|
      attribute = {
        code: code,
        name: names[index]
      }
      Subject.find_or_create(attribute)
    end
  end
end