def guest_num
  txt = open('people.csv')
  guest_counter = 0
  txt.each_line do |line|
    other_guests = line.split(',')
    guest_counter += other_guests[2].to_i + 1
  end
  guest_counter
end

def rand_rsvp
  names = ['Sally','John','Harambe','Padjen','Katy','Spongegar','Pepe','Raven',]
  emails = ['notanemail@scam.com', 'morefakeemails@nigerianprince.com', 'hoax@moonlanding.org', 'com@name.aol']
  guests = rand(9) + 1
  food = food_list
  name = names[rand(names.length)]
  email = emails[rand(emails.length)]
  info = name.to_s + ',' + email.to_s + ',' + guests.to_s + ',' + food.to_s
  txt = open('people.csv', 'a')
  txt.puts info
end

def remove_food
  people = open('people.csv')
  food = open('foods.csv')
  peoples_list = []
  foods_list = []
  new_foods_list = []

  people.each_line do |line|
    temp_people_list = line.split(',')
    peoples_list.push(temp_people_list[3])
  end

  food.each_line do |line|
    foods_list.push(line)
  end

  new_foods_list = foods_list

  foods_list.each do |food|
    array_place = 0
    peoples_list.each do |people|
      if food == people
        new_foods_list.slice(array_place)
      end
    end
    array_place +=1
  end

  print new_foods_list
  print peoples_list

  replace = open('foods.csv', 'w+')
  replace.write(new_foods_list.join)
end

def food_list
  foods = []
  txt = open('foods.csv')
  txt.each_line do |line|
    foods.push(line)
  end
  food_list = foods[rand(foods.length)]
end
print guest_num
print rand_rsvp
print remove_food
