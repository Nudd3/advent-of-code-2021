# frozen_string_literal: false

# Advent of Code 2021: Day 1

input = File.read('input.txt').split("\n").map(&:to_i)

# Take two elements at a time and see if the latter one is larger than the first. Count how many time that happens
puts(input.each_cons(2).count { |a, b| b > a })

# Take three elements and calculate the sum out of them. Do that two times and compare the result. Count how many times that happens
puts(input.each_cons(3).map(&:sum).each_cons(2).count { |a, b| b > a })
