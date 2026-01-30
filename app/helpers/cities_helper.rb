module CitiesHelper
  def created_ago(city)
    "Created at: #{time_ago_in_words(city.created_at)} ago"
  end

  def time_since_created(city)
    "Time sence created: #{time_ago_in_words(city.created_at)}"
  end

def short_name(city)
  truncate(city.name, length: 10)
end 

def letter_count(city)
  pluralize(city.name.length, 'letter')
end

 def wrapped_name(city)
  word_wrap(city.name, line_width: 5)
 end

 def truncated_country(city)
   truncate(city.country, length: 30)
 end

 def excerpt_country(city)
   excerpt(city.country, radius: 10)
 end

 def pluralized_cities(count)
   pluralize(count, 'city')
 end

def city_link(city)
  link_to "#{city.name}, #{city.country}", city_path(city), class: "custom-city-link"
end

def button_for_city(city)
  button_to "View #{city.name}", city_path(city), method: :get, class: "btn btn-primary"
end

def url_for_city(city)  
  url_for(city)
end

def link_to_new_city(city)
  link_to "Create a New City", new_city_path(city), class: "btn=btn-success"
end

def current_page_is_cities_index?
  current_page?(cities_path)
end

def mail_to_city_info(city)
mail_to "me@john_doe.com", cc: "me@jane_doe.com",
        subject: "This is an example email"
 end

def strip_link (city)
  strip_tags("<a href='#{city_path(city)}'>#{city.name}</a>")
end

def strip_tags_example(city)
  strip_tags("<p>#{city.name} is Located in #{city.country}.</p>")
end

def sanitize_include_tags_only(city)
  sanitize("<p>#{city.name} is Located in #{city.country}.</p>
            ",tags: %w(ul, h1), attributes: %w(id: class style))
end

def sanitize_include_css_styles(city)
  sanitize("<p style='color: red;'>#{city.name} is Located in #{city.country}</p>
  ", tags: %w(p), attributes: %w(style))
end

def image_tag_for_city(city)
  image_tag "cities/#{city.name.downcase}.jpg", alt: city.name, class: "city-image", size: "200x200"
end

def audio_tag_for_city(city)
  audio_tag "cities/#{city.name.downcase}.mp3", controls: true
end

def audio_discovery_for_city(city)
auto_discovery_link_tag(:rss, "http://www.example.com/feed.rss", { title: "RSS Feed" })
end

def favicon_link_for_city(city)
  favicon_link_tag "cities/#{city.name.downcase}_favicon.ico"
end

def javascript_include_tag_for_city(city)
  javascript_include_tag "cities/#{city.name.downcase}.js", async: true
end 

def picture_tag_for_city(city)
  picture_tag do
    concat tag.source(srcset: asset_path("cities/#{city.name.downcase}.webp"), type: "image/webp")
    concat tag.source(srcset: asset_path("cities/#{city.name.downcase}.jpg"),  type: "image/jpeg")
    concat image_tag("cities/#{city.name.downcase}.jpg", alt: city.name, class: "city-picture", size: "200x200")
  end
end

def stylesheet_link_for_city(city)
stylesheet_link_tag ("cities/#{city.name.downcase}.css"), media: "all"
end

def video_tag_for_city(city)
  video_tag "cities/#{city.name.downcase}.mp3", controls: true, size: "320x240"
end

def javascript_tag_for_city(city)
  javascript_tag do 
    "alert('welcome to #{escape_javascript(city.name)}!');"
  end
end


def escaped_city_alert(city)
  escape_javascript("Welcome to #{city.name}! \"Great place\"")
end

def alternative_tag_for_city(city)
  content_tag(:article, class: "city-article") do
    concat content_tag(:h2, city.name, class: "city-name")
    concat content_tag(:p, "Country: #{city.country}", class: "city-country")
  end
end

def city_classes(city)
  token_list(
    "city-box",
    "big-city": city.name.length > 5,
    "small-city": city.name.length <= 5
  )
end

end