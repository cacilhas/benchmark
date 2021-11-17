local POPULATION = 100

math.randomseed(os.time())

local function qsort(data)
  if #data < 2 then return end
  local pivot = data[1]
  local left, right = {}, {}
  for i, value in ipairs(data) do
    if i > 1 then
      if value < pivot then
        table.insert(left, value)
      elseif value > pivot then
        table.insert(right, value)
      end
    end
  end
  qsort(left)
  qsort(right)
  local i = 1
  for _, value in ipairs(left) do
    data[i] = value
    i = i + 1
  end
  data[i] = pivot
  i = i + 1
  for _, value in ipairs(right) do
    data[i + 1] = value
    i = i + 1
  end
end

local data = {}
for i = 1, POPULATION do
    data[i] = math.random(0, 99)
end

qsort(data)

for _, value in ipairs(data) do
    io.write(tostring(value))
    io.write("\t")
end
io.write("\n")
io.flush()
