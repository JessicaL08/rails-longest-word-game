require 'open-uri'
require 'json'
class GamesController < ApplicationController


  def new
    @letters = [*('A'..'Z')].sample(10).join
  end

  def score
    @score = params[:whichletter]
    @tableau = params[:tableau]



    url = "https://dictionary.lewagon.com/#{params[:whichletter]}"
    html = URI.open(url).read
    json = JSON.parse(html)

      if json["found"] == true && @score.chars.all? { |letter| @tableau.include?(letter.upcase) }
    @score = "great!!!!"
      else
    @score = "We don't know this word, please retry"
      end
    # .chars
  end
end


# url = "https://api.url/"
# uri = URI(url)
# response = Net::HTTP.get(uri)
# data = JSON.parse(response)
# objs.each do |data|
#   title = data["title"]
