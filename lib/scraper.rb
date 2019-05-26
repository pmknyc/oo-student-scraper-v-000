require_relative "../lib/student.rb"
require 'open-uri'
require 'pry'

class Scraper
<<<<<<< HEAD
 
# index_url = '.fixtures/student-site.index.html'
# top layer page scrape, make student, get these attributes:
# students_array (array of indiv student hashes) = 
#   [{:name => "Abby Smith",:location => "Brooklyn, NY",:profile_url => "students/abby-smith.html"}, 
#    {:name => } ]

  def initialize(path)

=======

 index_url = '.fixtures/student-site.index.html'
  def self.scrape_index_page(index_url)
    #html = File.read(index_url)
    index = Nokogiri::HTML(File.read(index_url))

    scraped_students = []
# [# {:name => "Abby Smith", :location => "Brooklyn, NY",
# :profile_url => "students/abby-smith.html"} ]

    index.css("div.roster-cards-container.student_card").each do |student_card|
      scraped_students << {
        :name => student_card.css("div.card-text-container h4.student_name").text
      }
        #
      #  :location => student_card.css("div.card-text-container p.student-location").text,
      #  :profile_url => student_card.css("::before a").attribute("html").value
    #  }

    end
    p scraped_students
    binding.protect_from_forgery
>>>>>>> d7fcc1e9d5bc21e80733ce0e2d5b76328bbc5f2b
  end

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(File.read(index_url))
      doc.css('div.student-card').map do |student|
       {:name => student.css('h4').text, 
        :location => student.css('p').text,
        :profile_url => student.css('a').attribute('href').value}
     end
  end    

# second layer scrape indiv student profile pages. Add these attributes:
# :twitter, :linkedin, :github, :blog, :profile_quote, :bio
  def self.scrape_profile_page(profile_url)
<<<<<<< HEAD
    profile = Nokogiri::HTML(File.read(profile_url))
      # social_icons = []
      profile.css('div.social.psychology')

            
      # social_icons << icon.css('a').attribute('href').value.include?('twitter')
      # p social_icons
  end
    #   {
    #     :twitter => 
    #     :linkedin => icon.css('')  , 
    # :github    =>   , 
    # :blog =>        , 
    # :profile_quote =>  ,
    # } 
    #  p profile_url.css('.bio-block.details-block p').text

  #    {:bio => "test" 
  #   }
  #   end
  # end
# 
end # class end
=======
    html = File.read(index_url)
    index = Nokogiri::HTML(html)

    students = []

# [# {:name => "Abby Smith", :location => "Brooklyn, NY",
# :profile_url => "students/abby-smith.html"} ]

    index.css("div.roster-cards-container").each do |student_card|
      student = student_card.css("div.student_card id")
      # students[student]    #.gsub(""-card","").split
      p student
    end
  end

end
>>>>>>> d7fcc1e9d5bc21e80733ce0e2d5b76328bbc5f2b
