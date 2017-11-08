class OrderMailer < ApplicationMailer
  default from: 'Nghiem Dao <depot@example.com>'
  
  def received(order)
    @order = order

    mail to: order.email, subject: 'Pragmatic Store Order Confirmation'
  end

  def shipped(order)
    @order = order

    mail to: order.email, subject: 'Pragmatic Store Order Shipped'
  end
end
