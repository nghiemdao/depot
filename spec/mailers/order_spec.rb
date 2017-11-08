require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  describe "received" do
    let(:order) { create(:order) }
    let(:mail) { OrderMailer.received(order) }

    it "renders the headers" do
      expect(mail.subject).to eq("Pragmatic Store Order Confirmation")
      expect(mail.to).to eq([order.email])
      expect(mail.from).to eq(["depot@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(/Dear #{order.name}/)
    end
  end

  describe "shipped" do
    let(:order) { create(:order) }
    let(:mail) { OrderMailer.shipped(order) }

    it "renders the headers" do
      expect(mail.subject).to eq("Pragmatic Store Order Shipped")
      expect(mail.to).to eq([order.email])
      expect(mail.from).to eq(["depot@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Pragmatic Order Shipped")
    end
  end

end
