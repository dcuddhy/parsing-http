input = File.read("data/get_request.txt")

class Request

  attr_accessor :header_line

  def initialize
    @input = File.read("data/get_request.txt")
  end

  def get_collection
    @input.split("\n")[0]
  end

  def get_headers
    input_array = @input.split("\n")
    length = input_array.length-1
    remainder_array = input_array[1..length]

    if remainder_array.index("")
      index_space = remainder_array.index("")-1
      headers = remainder_array[0..index_space]
    else
      headers = remainder_array
    end
  end

  def parse_headers
    @final_headers = {}
    key_array = []
    value_array = []
    get_headers.each do |header|
      key_array << header.split(' ')[0].chop.downcase
    end
    get_headers.each do |header|
      value_array << header.split(' ')[1].downcase
    end
    key_array
    value_array

    counter = 0

    while counter < key_array.length
      @final_headers[key_array[counter]] = value_array[counter]
      counter += 1
    end

    @final_headers

  end

  def get_verb
    verb = get_collection.split(' ')[0]
    @verb = {}
    @verb["verb"] = verb
    @verb
  end

  def get_path
    path = get_collection.split(' ')[1].split("?")[0]
    @path = {}
    @path["path"] = path
    @path
  end

end

request = Request.new

p request.parse_headers
p request.get_verb
p request.get_path
