require_relative "../views/orders_view"

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository

    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
  end

  def add
    # Mostrar todos os meals e pedir ao user para escolher um
    meals = @meal_repository.all
    @meals_view.display(meals)
    index = @orders_view.ask_index
    meal = meals[index]

    # Mostrar todos os customers e pedir ao user para escolher um
    customers = @customer_repository.all
    @customers_view.display(customers)
    index = @orders_view.ask_index
    customer = customers[index]

    # Mostrar todos os employees RIDERS e pedir ao user para escolher um
    riders = @employee_repository.all_riders
    @orders_view.display_riders(riders)
    index = @orders_view.ask_index
    employee = riders[index]

    # Criar um novo order com os dados escolhidos
    order = Order.new(meal:, customer:, employee:)

    # Adicionar o order ao repository
    @order_repository.create(order)
  end

  def list_undelivered_orders
    # Pedir ao repository para devolver todos os orders não entregues
    orders = @order_repository.undelivered_orders

    # Mostrar os orders
    @orders_view.display(orders)
  end

  def list_my_orders(employee)
    # Pedir ao repository para devolver todos os orders do employee
    orders = @order_repository.undelivered_orders.select { |order| order.employee.id == employee.id }

    # Mostrar os orders
    @orders_view.display(orders)
  end

  def mark_as_delivered(employee)
    orders = @order_repository.undelivered_orders.select { |order| order.employee.id == employee.id }
    @orders_view.display(orders)
    index = @orders_view.ask_index
    order = orders[index]

    @order_repository.mark_as_delivered(order)
  end
end
