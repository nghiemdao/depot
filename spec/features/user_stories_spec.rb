require 'rails_helper'

RSpec.feature "UserStories", type: :feature do
  it "buying a product" do
    start_order_count = Order.count
    product = create(:product)

    visit store_index_path

    expect(page).to have_content I18n.t('store.index.title_html')

    first('.entry .button_to input[type=submit]').click
    
    cart = Cart.first

    expect(cart.line_items.size).to eq(1)
    expect(cart.line_items.first.product).to eq(product)

    visit new_order_path
    
    expect(page).to have_content I18n.t('orders.new.legend')
    
    fill_in 'order[name]', with: 'Foo Bar'
    fill_in 'order[address]', with: 'Address example'
    fill_in 'order[email]', with: 'foo@bar.com'
    select 'Check', from: 'order[pay_type]'
    click_on I18n.t('orders.form.submit')

    expect(page).to have_current_path(store_index_path)
    expect(cart.line_items.size).to eq(0)
    expect(Order.count).to eq(start_order_count + 1)
    
    order = Order.last
    
    expect(order.name).to eq('Foo Bar')
    expect(order.address).to eq('Address example')
    expect(order.email).to eq('foo@bar.com')
    expect(order.pay_type).to eq('Check')
    expect(order.line_items.size).to eq(1)
    expect(order.line_items.first.product).to eq(product)

    mail = ActionMailer::Base.deliveries.last

    expect(mail.to).to eq(['foo@bar.com'])
    expect(mail.from).to eq(['depot@example.com'])
    expect(mail.subject).to eq('Pragmatic Store Order Confirmation')
  end
end
