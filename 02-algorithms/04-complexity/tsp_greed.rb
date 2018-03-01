def nearest_neighbor(cities, target_city, path_array)
  cities[target_city][-1] = true
  closest_distance = 5000000
  index_of_closest = nil

  while path_array.length < cities.length - 1
    cities.each_with_index do |city, index|
      distance = distance(cities[target_city][0], city[1][0])
      if distance < closest_distance && distance > 0 && city[1][1] != true
        closest_distance = distance
        index_of_closest = index
      end
    end
    path_array << cities.keys[index_of_closest]
    nearest_neighbor(cities, cities.keys[index_of_closest], path_array)
  end
  path_array
end

def distance(city_1, city_2)
  Math.sqrt(((city_1[0] - city_2[0])**2 + (city_1[1] - city_2[1])**2).abs)
end

map = {
  :los_angeles => [[3, 3], false],
  :long_beach => [[1, 1], false],
  :san_diego => [[-5, -5], false],
  :irvine => [[0, 0], false],
  :new_york => [[2000, 500], false],
  :san_francisco => [[0, 100], false]
}

puts nearest_neighbor(map, :irvine, [])
