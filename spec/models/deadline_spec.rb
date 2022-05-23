require 'rails_helper'

RSpec.describe Deadline, type: :model do
  describe '#valid?' do
    it 'distance_min not be blank' do
      deadline = Deadline.new(distance_min: '')
      deadline.valid?
      expect(deadline.errors.include? :distance_min).to eq true
    end

    it 'distance_max not be blank' do
      deadline = Deadline.new(distance_max: '')
      deadline.valid?
      expect(deadline.errors.include? :distance_max).to eq true
    end

    it 'time_arrive not be blank' do
      deadline = Deadline.new(time_arrive: '')
      deadline.valid?
      expect(deadline.errors.include? :time_arrive).to eq true
    end
  end
end
