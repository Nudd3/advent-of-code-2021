# frozen_string_literal: false

# forward X increases the horizontal position by X units.
# down X increases the depth by X units.
# up X decreases the depth by X units.

def change_course(line)
  command = line.split(' ')[0]
  amount = line.split(' ')[1].to_i

  case command
  when 'forward' then @horizontal += amount
  when 'down' then @depth += amount
  else @depth -= amount
  end
end

@horizontal = 0
@depth = 0

File.open('../input/input.txt').readlines.each do |line|
  change_course(line)
end


puts "result: #{@horizontal * @depth}"
