class LogParser

  def initialize(file_path)
    raise ArgumentError.new("file_path must be a String") unless file_path.class == String
    @file_path = file_path
  end

  def visits
    process_log unless @visits
    @visits
  end

  def most_visits
    return @most_visits if @most_visits
    @most_visits = visits.map {|path, visits| [path, visits.size] }.sort_by(&:last).reverse
  end

  def most_unique_visits
    return @most_unique_visits if @most_unique_visits
    @most_unique_visits = visits.map {|path, visits| [path, visits.uniq.size] }.sort_by(&:last).reverse
  end

  private

  def process_log
    @visits = {}

    IO.foreach(@file_path) do |line|
      path, address = line.split(" ")
      visits[path] ||= []
      visits[path] << address
    end
  end
end
