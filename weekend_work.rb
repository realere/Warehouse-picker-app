require "pry-byebug"

@items_hash_1={'a10' => 'rubber band','a9' => 'glow stick', 'a8' => 'model car', 'a7' => 'bookmark', 'a6' => 'shovel', 'a5' => 'rubber duck', 'a4' => 'hanger', 'a3' => 'blouse', 'a2' => 'stop sign', 'a1' => 'needle', 'c1'=>'rusty nail', 'c2'=>'drill press', 'c3'=>'chalk', 'c4'=>'word search', 'c5'=>'thermometer', 'c6'=>'face wash', 'c7'=>'paint brush', 'c8'=>'candy wrapper', 'c9'=>'shoe lace', 'c10'=>'leg warmers', 'b1'=>'tire swing', 'b2'=>'sharpie', 'b3'=>'picture frame', 'b4'=>'photo album', 'b5'=>'nail filer','b6'=>'tooth paster', 'b7'=>'bath fizzers', 'b8'=>'tissue box', 'b9'=>'deodorant', 'b10'=>'cookie jar'}

@items_hash_2={'rubber band'=>'a10' ,'glow stick'=>'a9', 'model car'=>'a8', 'bookmark'=> 'a7', 'shovel'=>'a6',  'rubber duck'=>'a5', 'hanger'=>'a4','blouse'=>'a3', 'stop sign'=>'a2', 'needle'=>'a1', 'rusty nail'=>'c1', 'drill press'=>'c2', 'chalk'=>'c3', 'word search'=>'c4', 'thermometer'=>'c5', 'face wash'=>'c6', 'paint brush'=>'c7', 'candy wrapper'=>'c8', 'shoe lace'=>'c9', 'leg warmers'=>'c10', 'tire swing'=>'b1', 'sharpie'=>'b2', 'picture frame'=>'b3', 'photo album'=>'b4', 'nail filer'=>'b5','tooth paster'=>'b6', 'bath fizzers'=>'b7', 'tissue box'=>'b8', 'deodorant'=>'b9', 'cookie jar'=>'b10'}

@bays_array=['a10', 'a9', 'a8', 'a7', 'a6', 'a5', 'a4', 'a3', 'a2', 'a1', 'c1', 'c2', 'c3', 'c4', 'c5', 'c6', 'c7', 'c8', 'c9', 'c10', 'b1', 'b2', 'b3', 'b4', 'b5','b6', 'b7', 'b8', 'b9', 'b10']

def menu
  puts `clear`
  puts "*** Warehouse Picker App ***"
  puts "Hello and welcome, which function would like to use today..."
  print "(1) Check bays to see which items they contain, (2) Check the bay location of items or (q)uit: "
  gets.chomp.downcase
end

def bay_selection
  puts "You have selected to find which items are contained in particular bays." 
  print "Please select the bays you wish to check: " 
  bays_list= gets.chomp.downcase
  selection= bays_list.split(" ")
  
    selection.each do |one_selection|
    result=@items_hash_1[one_selection]
    puts "#{one_selection} is #{result}" 
  end
  distance=selection.map { |s| @bays_array.index(s) }.max
  puts "You will have to walk #{distance} steps from the entrance to retrieve all of your items."
end

#binding.pry

def item_selection
  puts "You have selected to find the location of particular items." 
  print "Please identify the items you wish to check. If choosing more than one bay please separate with commas: " 
  items_list= gets.chomp.downcase
  selection=items_list.split(", ")

    list_of_bays=[]
    selection.each do |one_selection|
    result=@items_hash_2[one_selection]
    puts "#{one_selection} is #{result}" 
    list_of_bays<< result
  end
  distance=list_of_bays.map { |s| @bays_array.index(s) }.max
  puts "You will have to walk #{distance} steps from the entrance to retrieve all of your items."
end

response = menu

until response == 'q'
  case response
  when '1'
    bay_selection
  when '2'
    item_selection
  end

  puts "To continue press enter..."
  sleep = gets

  response = menu
end