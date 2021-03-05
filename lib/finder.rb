# frozen_string_literal: true

class Finder
  def initialize(data_set)
    @data_set = data_set
  end

  def find_by_attr(attr, value)
    data_set.detect { |data| data.public_send(attr) == value }
  end

  def find_all_by_array_attr(attr, value)
    data_set.select { |data| data.public_send(attr).include? value }
  end

  private

  attr_accessor :data_set
end
