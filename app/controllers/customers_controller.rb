require_relative "../views/customers_view"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def add
    # Ask user for customer name
    name = @view.ask_for("name")
    # Ask user for customer price
    address = @view.ask_for("address")
    # Create a new customer instance
    customer = Customer.new(name: name, address: address)
    # Add the customer to the repository
    @customer_repository.create(customer)
  end

  def list
    # Get all customers from the repository
    customers = @customer_repository.all
    # Display all customers
    @view.display(customers)
  end
end
