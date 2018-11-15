class LogParser

  attr_reader :log

  def initialize(file_path)
    raise ArgumentError.new("file_path must be a String") unless file_path.class == String

    @log = []
    IO.foreach(file_path) {|line| @log << line.split(" ") }
  end

  def most_visits
    return @most_visits if @most_visits

    visits = Hash.new(0)
    log.each {|line| visits[line[0]] += 1 }

    @most_visits = visits.sort_by(&:last).reverse
  end

  def most_unique_visits
    return @most_unique_visits if @most_unique_visits

    visits = {}
    log.each do |line|
      path, address = line
      visits[path] ||= []
      visits[path] << address
    end

    @most_unique_visits = visits.map {|path, visits| [path, visits.uniq.size] }.sort_by(&:last).reverse
  end
end
