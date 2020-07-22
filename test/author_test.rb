require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'

class AuthorTest < Minitest::Test
  def setup
    @author = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @author
  end

  def test_name
    assert_equal "Charlotte Bronte", @author.name
  end
end
