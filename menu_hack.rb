#Menu Hack
require 'colorize'

menu = {
  sections: [{
    name: "Tacos",

    items: [
    {
      name: "AL PASTOR",
      description: "pork, achiote, pineapple",
      price: 3.50
    },
    {
      name: "CHORIZO",
      description: "pork, paprika, cumin, garlic",
      price: 3.50
    },
    {
      name: "BARBACOA",
      description: "beef, cumin, pasilla negra",
      price: 3.50
    },
    {
      name: "POLLO",
      description: "chicken, scallion, cilantro",
      price: 3.50
    },
    {
      name: "HUITLACOCHE",
      description: "corn ‘truffle’, corn, scallion",
      price: 3.50
    },
    {
      name: "CARNITAS",
      description: "pork, orange, cinnamon",
      price: 3.50
    },
    {
      name: "ASADA",
      description: "steak, citrus, chile de arbol",
      price: 5.00
    },
    {
      name: "LENGUA",
      description: "beef tongue, cerveza victoria",
      price: 3.50
    },
    {
      name: "CAMARON",
      description: "shrimp, red ‘mole’, slaw",
      price: 5.00
    },
    {
      name: "RAJAS",
      description: "poblano, onion, crema, cotija",
      price: 3.50
    },
    {
      name: "CHAPULINES",
      description: "grasshoppers, avocado, tajin",
      price: 3.50
  }]
},
  {name: "Sides / Antojitos",

  items: [
  {
    name: "TOTOPOS",
    description: "hand torn blue masa chips",
    price: 5.00
  },
  {
    name: "ELOTE",
    description: "charred corn, cilantro- jalapeno crema, cotija",
    price: 5.00
  },
  {
    name: "QUINOA",
    description: "jicama, corn, scallion, chile, nopal dressing",
    price: 6.50
  }]
  },
  {name: "Breakfast",
  items: [
  {
    name: "HUEVOS A LA MEXICANA",
    description: "scrambled eggs, pico, frijoles, crema, tortillas",
    price: 5.00
  },
  {
    name: "QUESADILLAS DE EPAZOTE",
    description: "queso chihuahua, cotija, epazote, pico, frijoles",
    price: 5.00
  },
  {
    name: "TOSTADA DE AGUACATE",
    description: "avocado, egg, frijoles, cabbage, cotija",
    price: 6.00
  },
  {
    name: "CHILAQUILES",
    description: "crispy masa, pollo, salsa roja, eggs, crema",
    price: 6.00
  },
  {
    name: "TORTILLA DE AGUACATE",
    description: "avocado, queso chihuahua, cotija, frijoles",
    price: 6.00
  }
  ]},
  {name: "Coffee & Tea",
  items: [
  {
    name: "ESPRESSO",
    description: "queso chihuahua, cotija, epazote, pico, frijoles",
    price: 4.00
  },
  {
    name: "LA ENDULZADA",
    description: "espresso, condensed milk, ice, shaken",
    price: 5.00
  },
  {
    name: "GREEN TEA",
    description: "Jasmine Cloud by JoJo Tea",
    price: 3.00
  },
  {
    name: "ORANGE JUICE",
    description: "Fresh Squeezed Florida OJ",
    price: 5.00
  },
  ]},
  {name: "BEER / CERVEZA",
  items: [
  {
    name: "Corona Extra",
    price: 7.00
  },
  {
    name: "Corona Light",
    price: 6.00
  },
  {
    name: "Negra Modelo",
    price: 6.00
  },
  {
    name: "Pacifico",
    price: 6.00
  },
  {
    name: "Tecate",
    price: 5.00
  },
  {
    name: "Victoria",
    price: 6.00
  },
  {
    name: "Rotating Craft Selection",
    price: 8.00
  }
  ]}
]}

MENU = menu

@order = []

def show_menu(menu)
    x = 0
    menu[:sections].each do |i|
    puts i [:items]
      i[:items].each do |q|
        puts q[:name]
        puts q[:description]
        puts q[:price]
      end
    end
end


p show_menu(menu)

puts "            +-+-+-+-+-+-+-+ +-+-+".green
puts "            |W|E|L|C|O|M|E| |t|o|".green
puts "            +-+-+-+-+-+-+-+ +-+-+".green
puts "              +-+-+-+-+-+-+-+".green
puts "              |T|A|Q|U|I|Z|A|".green
puts "              +-+-+-+-+-+-+-+".green

puts "   ,-''-.".blue
puts "  _r-----|          _".blue
puts "  ]      |-.     ,''''.".blue
puts "  |     | |     ,-------.".blue
puts "  |     | |    c|       |                      ,--.".blue
puts "  |     |'      |       |     _______________ C|  |".blue
puts "  (=====)       =========     L_____________/  `=='".blue
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".red


#p show_menu(menu)
puts "Would you like to see the menu?"
puts "type: show menu"
input = gets.chomp

if input == "show menu"
  show_menu(menu)
end

puts "~"*50

def get_item_info(item_name)
  MENU[:sections].each do |section|
    section[:items].each do |item|
      if item[:name].downcase == item_name.downcase
        return item
      end
    end
  end
end

ITEM_NAMES = []
MENU[:sections].each do |section|
  section[:items].each do |item|
    ITEM_NAMES << item[:name].downcase
  end
end


puts "What would you like to order? (Type 'get the check' when you are done)"
prompt = gets.chomp.downcase

until prompt == "get the check"
  if ITEM_NAMES.include?(prompt)
    @order << get_item_info(prompt)
    puts "ok, what else would you like to order?"
    prompt = gets.chomp.downcase
  else
    puts "That is not on the menu! Order something else"
    prompt = gets.chomp.downcase
  end
end

puts "Would you like the check? (type yes)"
prompt = gets.chomp.downcase
if prompt == "yes"
  subtotal = @order.inject(0){ |sum, item| sum += item[:price]}
  @order.each do |item|
    puts "Name: #{item[:name]} ------  Price: $#{item[:price]}"
  end
  tax = subtotal * 0.06
  total = subtotal + tax
  puts "Subtotal: $#{subtotal}",
       "6\% tax is: #{tax}",
       "Total: $#{total}"

else
  puts "ok then."
end
