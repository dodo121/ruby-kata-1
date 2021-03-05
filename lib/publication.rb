# frozen_string_literal: true

class Publication
  attr_accessor :title, :isbn, :authors, :description, :published_at

  def initialize(data)
    @title = data['title']
    @isbn = data['isbn']
    @authors = data['authors']&.split(',')
    @description = data['description']
    @published_at = data['publishedAt']
  end

  def authors_formatted
    @authors&.join(',')
  end
end
