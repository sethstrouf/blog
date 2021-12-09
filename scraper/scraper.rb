require 'open-uri'
require 'nokogiri'
require 'pry'

File.write('data', "[\n")

pages = 5
page_url = "/blog"

pages.times do
  # Index page
  html = URI.open("https://hannahbauer.com#{page_url}", "User-Agent" => "Seth")
  doc = Nokogiri::HTML(html)
  posts_per_page = doc.css("div.content-wrapper").count - 1
  
  
  for i in 0...posts_per_page
    # Get rid of the "read more" at the end
    summary = doc.css("div.body")[i].text.split('.')[0...-1].join('.') + "."
    
    image_url = ""
    # Check to see if the div contains a picture (figure)
    # Figure should aways be the third child of each content wrapper
    if doc.css("div.content-wrapper")[i].children[3].name === "figure"
      value = doc.css("div.content-wrapper")[i].children[3].attributes["style"].value
      # RegEx magic to get URL from style background-image
      image_url = value[/url\((.+)\)/, 1]
    end
    
    # Get link to the individual post
    href = doc.css("a.inline-read-more")[i]["href"] 
    
    # Inside a single post
    html2 = URI.open("https://hannahbauer.com#{href}", "User-Agent" => "Adam")
    doc2 = Nokogiri::HTML(html2)
    
    title = doc2.css("header h1 a").text.split("\t")[14]
    date = doc2.at("time[datetime]")["datetime"]
    # Don't include last element because it's the footer
    body = doc2.css("p")[0...-1].text
    
    post = {
      title: title,
      date: date,
      summary: summary,
      body: body,
      image_url: image_url
    }
    
    File.write('data', post, mode: 'a')
    File.write('data', ",\n", mode: 'a')
  end
  # Get link for next page if one exists (if not on final page)
  if doc.css("a#nextLink").length > 0
    page_url = doc.css("a#nextLink")[0].attributes["href"].value
  end
end

File.write('data', ']', mode: 'a')
