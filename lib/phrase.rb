require 'json'

class Phrase
  attr_reader :template, :labels

  def initialize(config_hash)
    # Hint: save parts of the config_hash as @template and @labels
    @template = config_hash["template"]
    @labels = config_hash["labels"]
  end

  def format(words)
    # Hint: use String#split
    return "Bad length" if words.length != labels.length
    final_string = template
    words.each { |word| final_string.sub!('[_]', word) }
    final_string
  end

  def self.load(file_path)
    # Hint: use the JSON module
    all_phrases = JSON.load(File.read(file_path))
    #all_phrases.each { |key, value| all_phrases[key] = Phrase.new({key => value}) }
    puts all_phrases["problems"]["labels"].inspect
    all_phrases.keys.each { |key| all_phrases[key] = Phrase.new({"template" => all_phrases[key]["template"], "labels" => all_phrases[key]["labels"]}) }
    all_phrases
  end
end
