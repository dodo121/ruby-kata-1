# frozen_string_literal: true

require 'csv'

class CsvObjectsLoader
  attr_accessor :objects

  def initialize
    @objects = []
  end

  def create_objects(file, obj_klass)
    CSV.foreach(file, { headers: true, col_sep: ';', encoding: 'bom|UTF-8' }) do |row|
      objects << obj_klass.new(row.to_h)
    end
  end
end
