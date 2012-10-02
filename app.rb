#!/usr/bin/env ruby

###
# Description: A simple word game for the web
# Author: <your name + email here>
###

require 'rubygems'
require 'json'

require 'sinatra'

$LOAD_PATH << File.dirname(__FILE__) + "/lib"
STDERR.puts $LOAD_PATH.inspect
require 'phrase'

configure do
  # Hint: load phrases from data/phrases.json using the Phrase class
  $phrases = Phrase.load('data/phrases.json')
end

get '/' do
  # Hint: pick a random phrase and display the form
  key = $phrases.keys[rand($phrases.length)]
  phrase = $phrases[key]
  erb :index, :locals => {:labels => phrase.labels, :key => key}
end

get '/show/:phrase' do
  # Hint: look up the phrase, then populate it with the words from the form
  sentence = $phrases[params[:phrase]].format(params['words'])
  erb :result, :locals => {:sentence => sentence} 
end
