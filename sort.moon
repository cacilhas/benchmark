#!/usr/bin/env moon

local *

POPULATION = 100

math.randomseed os.time!

qsort = =>
  return if #@ < 2
  pivot = @[1]
  left, right = {}, {}
  for i, value in ipairs @
    if i > 1
      if value < pivot
        table.insert left, value
      else
        table.insert right, value
  qsort left
  qsort right
  i = 1
  for _, value in ipairs left
    @[i] = value
    i += 1
  @[i] = pivot
  i += 1
  for _, value in ipairs right
    @[i] = value
    i += 1

data = {}
data[i] = math.random 0, 99 for i = 1, POPULATION

qsort data

for _, value in ipairs data
  io.write value
  io.write "\t"

io.write "\n"
io.flush!
