require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'
require './lib/library'

class LibraryTest < Minitest::Test
  def setup
    @library = Library.new("Denver Public Library")
  end

  def test_it_exists
    assert_instance_of Library, @library
  end

  def test_name
    assert_equal "Denver Public Library", @library.name
  end

  def test_no_books_by_default
    assert_equal [], @library.books
  end

  def test_no_authors_by_default
    assert_equal [], @library.authors
  end
end
