class CustomersView
  def ask_for(attribute)
    puts "What is the customer #{attribute}?"
    print "> "
    gets.chomp
  end

  def display(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1} - #{customer.name} - Addr: #{customer.address}"
    end
  end
end
