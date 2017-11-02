require 'rails_helper'

RSpec.describe Order, type: :model do
  it "attributes must present" do
    order = Order.new
    
    expect(order.invalid?).to be_truthy
    expect(order.errors[:name].any?).to be_truthy
    expect(order.errors[:address].any?).to be_truthy
    expect(order.errors[:email].any?).to be_truthy
    expect(order.errors[:pay_type].any?).to be_truthy
  end

  it "pay type must be existed" do
    order = build(:order, pay_type: nil)
    
    expect(order.invalid?).to be_truthy
    expect(order.errors[:pay_type]).to eq([I18n.t('errors.messages.inclusion')])
  end
end
