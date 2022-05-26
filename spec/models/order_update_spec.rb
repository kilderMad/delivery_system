require 'rails_helper'

RSpec.describe OrderUpdate, type: :model do
  describe "#valid" do
    it 'date not be blank' do
      order_update = OrderUpdate.new(date: '')
      order_update.save
      expect(order_update.errors.include? :date).to eq true
    end

    it 'hour not be blank' do
      order_update = OrderUpdate.new(hour: '')
      order_update.save
      expect(order_update.errors.include? :hour).to eq true
    end

    it 'last_location not be blank' do
      order_update = OrderUpdate.new(last_location: '')
      order_update.save
      expect(order_update.errors.include? :last_location).to eq true
    end

    it 'next_location not be blank' do
      order_update = OrderUpdate.new(next_location: '')
      order_update.save
      expect(order_update.errors.include? :next_location).to eq true
    end
  end
end
