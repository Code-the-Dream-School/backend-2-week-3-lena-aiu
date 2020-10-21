require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  subject { Order.new( product_name: "gears", product_count: 7, customer: FactoryBot.create(:customer))}
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  
  it "is not valid without a product_name" do
    subject.product_name=nil
    expect(subject).to_not be_valid
  end
 
  it "is not valid without a product_count" do
    subject.product_count=nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid if a product_count is not all digits" do 
	expect(subject.product_count.size).to be_a Integer 
  end
   
  it "is not valid without a customer exist" do
    subject.customer_id="999"
    expect(subject).to_not be_valid
  end
  
end
