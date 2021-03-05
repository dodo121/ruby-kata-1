# frozen_string_literal: true

class Sorter
  def initialize(data_set)
    @data_set = data_set
  end

  def sort_by(attr)
    data_set.sort_by { |data| data.public_send(attr) }
  end

  private

  attr_accessor :data_set
end
