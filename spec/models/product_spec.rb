require 'rails_helper'

RSpec.describe Product, type: :model do
  it "product attributes must not be empty" do
    product = Product.new
    expect(product.invalid?).to be_truthy
    expect(product.errors[:title].any?).to be_truthy
    expect(product.errors[:description].any?).to be_truthy
    expect(product.errors[:price].any?).to be_truthy
    expect(product.errors[:image_url].any?).to be_truthy
  end

  it "product price must be positive" do
    product = build(:product, price: -1)
    expect(product.invalid?).to be_truthy
    expect(product.errors[:price]).to eq([I18n.t('errors.messages.greater_than_or_equal_to', count: 0.01)])
    
    product.price = 0
    expect(product.invalid?).to be_truthy
    expect(product.errors[:price]).to eq([I18n.t('errors.messages.greater_than_or_equal_to', count: 0.01)])

    product.price = 1
    expect(product.valid?).to be_truthy
  end

  it "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
             HTTP://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more fred.gif\ndoc }

    ok.each { |name| expect(build(:product, image_url: name).valid?).to be_truthy }
    bad.each { |name| expect(build(:product, image_url: name).invalid?).to be_truthy }
  end

  it "product is not valid without a unique title" do
    product = create(:product)

    dump_product = build(:product, title: product.title)

    expect(dump_product.invalid?).to be_truthy
    expect(dump_product.errors[:title]).to eq([I18n.t('errors.messages.taken')])
  end
end
