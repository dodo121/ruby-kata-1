# frozen_string_literal: true
require_relative './publication'
require_relative './sorter'
require_relative './finder'
require_relative './objects_loader'
require 'table_print'

module Echocat
  def self.load_pubs
    loader = CsvObjectsLoader.new
    loader.create_objects('data/books.csv', Publication)
    loader.create_objects('data/magazines.csv', Publication)
    loader.objects
  end

  def self.print_table(pubs)
    tp pubs, :title, :isbn, :description, :published_at, authors: { display_method: :authors_formatted }
  end

  def self.run
    pubs = load_pubs
    puts '*** All Publications ***'
    print_table(pubs)

    # by isbn
    puts ''
    puts '*** Search by isbn 4545-8558-3232 ***'
    finder = Finder.new(pubs)
    print_table([
      finder.find_by_attr('isbn', '4545-8558-3232')
    ])

    # by authors
    puts ''
    puts '*** Search by author null-walter@echocat.org ***'
    print_table(
      finder.find_all_by_array_attr('authors', 'null-walter@echocat.org')
    )

    # sort_by_title
    puts ''
    puts '*** Sort by title ***'
    sorter = Sorter.new(pubs)
    print_table(
      sorter.sort_by('title')
    )

    ### save all publications to csv
    f = File.open("data/all_publications.csv", "w")
    tp.set :io, f
    tp.set :separator, ";"
    print_table(pubs)
    tp.clear :io
  end
end
