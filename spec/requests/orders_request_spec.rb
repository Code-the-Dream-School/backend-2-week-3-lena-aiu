require 'rails_helper'

RSpec.describe "Orders", type: :request do
#subject { Customer.new(first_name: "Jack", last_name: "Smith", phone: "8889995678", email: "jsmith@sample.com" )}
subject { Order.new( product_name: "gears", product_count: 7, customer: FactoryBot.create(:customer))}
  describe "get orders_path" do
    it "renders the index view" do
      FactoryBot.create_list(:order, 10)
      get orders_path
      expect(response.status).to eq(200)
    end
  end
  describe "get order_path" do
    it "renders the :show template" do
      order = FactoryBot.create(:order)
      get order_path(id: order.id)
      expect(response.status).to eq(200)
    end
    it "redirects to the index path if the order id is invalid" do
      get order_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to orders_path
    end
  end

  describe "get new_order_path" do
    it "renders the :new template"
  end
  describe "get edit_order_path" do
    it "renders the :edit template"
  end 
  
  describe "post orders_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      order_attributes = FactoryBot.attributes_for(:order)
      expect { post orders_path, params: {order: order_attributes}
    }.to change(Order, :count)
      expect(response).to redirect_to order_path(id: Order.last.id)
    end
  end
  
  describe "post orders_path with invalid data" do
    it "does not save a new entry or redirect" do
      order_attributes = FactoryBot.attributes_for(:order)
      order_attributes.delete(:product_name)
      expect { post orders_path, params: {order: order_attributes}
    }.to_not change(Order, :count)
      expect(response.status).to eq(200)
    end
  end
  describe "put order_path with invalid data" do
    it "does not update the order record or redirect" do
	  order = FactoryBot.create(:order)
      put order_path(id: order.id), params: {order: { product_count: "letters"}}
      order.reload
      expect(order.email).to_not eq("letters")
      expect(response.status).to eq(200)
    end
  end
  describe "delete a order record" do
    it "deletes a order record" do
	  order = FactoryBot.create(:order)
      expect { delete order_path(id: order.id)
             }.to change(Order, :count)
      expect(response).to redirect_to orders_path
    end
  end
  
end
