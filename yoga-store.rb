
# Empty Shopping cart
@shopping_cart = []

# Product list in an array
@products = [
  { reference_number: 1231, name: "Super Lite Mat", price: 10 },
  { reference_number: 1232, name: "Power Mat", price: 20 },
  { reference_number: 1233, name: "Block", price: 30 },
  { reference_number: 1234, name: "Meditation cushion", price: 30 },
  { reference_number: 1235, name: "The best T-shirt", price: 200 },
  { reference_number: 1236, name: "The cutest yoga pants", price: 300 },
  { reference_number: 1237, name: "Bring Yoga To Life", price: 30 },
  { reference_number: 1238, name: "Light On Yoga", price: 10 }
]

# Lets define some methods now
# Mehtod to display items
def display_products

  puts "Welcome to our store! We have following products in our store:"
  @products.each do |product|
    puts "Reference Number: #{product[:reference_number]}, Product: #{product[:name]}, Price: #{product[:price]}"
  end
end

# Select product method
def select_product

  puts "Please select the reference number of the product you want"
  gets.chomp.to_i
end

# Find product in @products
def find_product(reference_number)
  @products.each do |product|
    if product[:reference_number] == reference_number.to_i
      return product
    end
  end
end

# Add to cart method
def add_to_cart(reference_number)
  product = find_product(reference_number)
  if product != nil
    @shopping_cart << product
    puts "Congratulations. '#{product[:name]}' has been added to the cart!"
  else
    puts "Please select a valid reference number"
  end
end

# Show cart
def show_cart
  puts "You have following items in your cart"
  total_price = 0
  @shopping_cart.each do |product|
    puts "Reference Number: #{product[:reference_number]}, Product: #{product[:name]}, Price: #{product[:price]} Euros"
    total_price = total_price + product[:price]
  end
  puts "Total price: #{total_price} Euros"
  @shopping_cart
end

# Ask for continue shopping or exit
def ask_continue_exit
  puts "Do you want to continue shopping? (Y/N)"
  answer = gets.chomp
  answer.upcase == "Y"
end

loop do
  puts "Welcome to the Yoga Shop!"
  display_products
  product_reference_number = select_product
  add_to_cart(product_reference_number)
  show_cart

  continue_shopping = ask_continue_exit
  break unless continue_shopping
end

# Bye Bye

puts "Thank you for shopping with us"
