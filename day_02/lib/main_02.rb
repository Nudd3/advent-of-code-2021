# frozen_string_literal: false

# down X increases your aim by X units.
# up X decreases your aim by X units.
# forward X does two things:
#    It increases your horizontal position by X units.
#    It increases your depth by your aim multiplied by X.

def change_course(line)
  command = line.split(' ')[0]
  amount = line.split(' ')[1].to_i

  case command
  when 'down' then @aim += amount
  when 'up' then @aim -= amount
  when 'forward'
    @horizontal += amount
    @depth += (@aim * amount)
  end
end

@horizontal = 0
@depth = 0
@aim = 0

File.open('../input/input.txt').readlines.each do |line|
  change_course(line)
end

puts "result: #{@horizontal * @depth}"
