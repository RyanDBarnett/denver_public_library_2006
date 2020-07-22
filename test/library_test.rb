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
end
