def hello
  puts "hello World"
end

hello

def hi (name = "World")
  puts "hello #{name}"
end

hi 'John'

def add (x, y)
  x + y
end

add(1, 2)
puts add 1, 2

def multiply(val1, val2)
    result = val1 * val2
    return result
end

alias magic multiply

puts magic 2, 4

require 'json'
class Car

  # attr_reader :current_km
  attr_accessor :current_km

  def initialize current
    #CONSTRUCTOR
    #CLASS ATTRIBUTES @
    @service_at = 25000
    @current_km = current
    @@allIn = 0
  end

  def drive(miles)
    @current_km += miles
  end

  def requires_service
    @current_km >= @service_at
  end
end

# initializes an instance of Boogy
car = Car.new 20
car.drive(20000);
puts car.current_km
car.drive(6000);
puts car.requires_service
# method calls without params generate errors
# car.drive
y = 10
puts y.class
y = "200"
puts y.class
y = 10
puts y.to_f
puts y.to_s

$x = 10
puts defined? $x
puts defined? y

# ranges
pp ('cab'..'car').to_a

# arrays
days = ["today", "tomorrow"]
days.push "hey"
puts days.index "hey"
pp days
puts days.empty?
puts days.size
puts days.first
puts days.last
puts days[0]
# puts days.pop

#array operations
array = ["hey", "mon", "tues"]

pp array | days
pp array & days
pp array - days

# expressions
# ! && ||
puts (not true)
puts (true and true)
puts (true or false)


if true then
  p "ok good"
end

if true
  p "another way"
end

if false

elsif true
  p "another day"
end


manufacturer = case "abc"
   when "abc" then "Ford"
   when "tr" then "Lincoln"
   else "Unknown"
end

puts manufacturer


i = 0
while i < 5
   puts i
   i += 1
   break unless i != 2
end

i = 0
until i == 5
   puts i
   i += 1
end


for i in 1..8 do
    puts i
end

loop do
    # some code here
    puts "one"
    break if true
end

begin
    puts "two"
end while false

5.times { |i| puts i }

5.upto(10) do
  puts "hello"
end

x = gets
15.downto(x.to_i) {|i| puts i }


def modify (x)
    x = 33;
end
press = 10
press2 = press
press2 = 5
puts modify press
puts press
puts press2

