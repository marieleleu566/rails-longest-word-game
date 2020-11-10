class GamesController < ApplicationController
  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end

  def new
    @letters = (0...10).map { ('a'..'z').to_a[rand(26)] }

    if @letters.include? params[:word]
      if params[:word].english_word?
        @result = 'Well done'
      else
        @result = 'not an english_word'
      end
    else
      @result = 'not in the grid'
    end
  end

  def score
    raise
  end
end
