class SalesTax

  def get_input
    item_list = ["1 book at 12.49","1 imported music CD at 14.99","2 chocolate bar at 0.85"]
  end

  def create_order(description)
    detail_list = description.split(" ")
    size = detail_list.length - 1
    { quantity: detail_list[0].to_i, price: detail_list[size].to_f, sales_tax_rate: sales_tax_rate(detail_list),
    is_imported: (detail_list.include? "imported")}
  end

    def process_order_item(description)
    item = create_order(description)
    tax = item_tax(item[:price], item[:sales_tax_rate], item[:is_imported])
    price = net_item_price(tax, item[:price])
    { quantity: item[:quantity], tax: tax, net_price: price, statement: description.split(" at")[0] }
    end

    def get_order_details(item_list)
    details_list = []
    item_list.each do |item|
      item_details = process_order_item(item)
      details_list << item_details
    end
    details_list
  end

end 
class SalesCalculator < SalesTax
  
  def initialize
    @exempted = ["chocolate", "chocolates", "pills", "book", "books"]
    @tax_rate = 0.10
  end

  def item_tax(price, tax_rate, is_imported)
    tax = is_imported ? (tax_rate + 0.05) * price : tax_rate * price
    round_off(tax)
  end

  def net_item_price(tax, price)
    price + tax
  end

  def print_item(item)
    puts "#{item[:statement]}: #{sprintf("%.2f", item[:net_price])}"
  end 
  
  def round_off(amount)
    (amount / 0.05) * 0.05
  end

  def get_total_cost(order_details)
    order_details.inject(0) { |cost, item| cost + (item[:net_price] * item[:quantity]) }
  end

  def get_total_sales_tax(order_details)
    order_details.inject(0) { |tax, item| tax + item[:tax] }
  end 

  def sales_tax_rate(detail_list)
    (@exempted & detail_list).empty? ? @tax_rate : 0
  end

end 
    order = SalesCalculator.new
    item_list = order.get_input
    order_details = order.get_order_details(item_list)
    total_cost = order.get_total_cost(order_details)
    total_sales_tax = order.get_total_sales_tax(order_details)
    order_details.each do |item|
    order.print_item(item) 
end
    puts "Sales Taxes: #{sprintf("%.2f", total_sales_tax)}" 
    puts "Total: #{sprintf("%.2f", total_cost)}"
