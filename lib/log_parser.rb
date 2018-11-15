class LogParser

  attr_reader :log

  def initialize(file_path)
    raise ArgumentError.new("file_path must be a String") unless file_path.class == String

    @log = []

    IO.foreach(file_path) do |line|
      @log << line.split(" ")
    end
  end

  def most_visits
    return @most_visits if @most_visits

    visits = Hash.new(0)
    log.each {|line| visits[line[0]] += 1 }

    @most_visits = visits.sort_by {|path, visits| visits }.reverse
  end
end
