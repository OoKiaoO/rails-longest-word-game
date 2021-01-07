require 'json'
# require 'rest-client'

class GamesController < ApplicationController
  def new
    alphabet = ('a'..'z').to_a
    @letters = []
    10.times do
      @letters << alphabet.sample
    end
  end

  def score
    @word = params[:word]
    response = RestClient.get "https://wagon-dictionary.herokuapp.com/#{@word}"
    parsed = JSON.parse(response)
    @found = parsed["found"]
    @results = {}
    if @found
      @results = {
        found: parsed["found"],
        word: parsed["word"], 
        length: parsed["length"]
      }
    else
      @results = {
        found: parsed["found"],
        word: parsed["word"], 
        error: parsed["error"]
      }
    end
    raise
  end
end
