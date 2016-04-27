require "csv"

# Create a picture from a CSV file and print a report about its colours
# Usage example:
#   Picture::FromCSV.new("input.csv")

class Picture
  class FromCSV
    def initialize(file)
      input = CSV.read(file)
      canvas_size = input.first.first.split.map(&:to_i)
      pictures = Picture.new(canvas_size.first, canvas_size.last)

      input.drop(1).each { |p| pictures.paint(*p.first.split.map(&:to_i)) }
      pictures.print_stadistics
    end
  end

  def initialize(rows, columns)
    @sheet = create_canvas(rows, columns)
  end

  def paint(colour, x, y, row_limit, column_limit)
    (0...column_limit).each do |column|
      (0...row_limit).each do |row|
        @sheet[y + row][x + column] = colour
      end
    end
    self
  end

  def stadistics
    @sheet.flatten.uniq.sort.map {|row| [row,@sheet.flatten.count(row)] }
  end

  def print_stadistics
    stadistics.each {|stadistic| puts "#{stadistic.first} #{stadistic.last}"}
  end

  def print_canvas
    @sheet.each { |row| puts row.join(" ") }
  end

  private

  def create_canvas(rows, columns )
    Array.new(rows) { Array.new(columns, 0) }
  end
end
