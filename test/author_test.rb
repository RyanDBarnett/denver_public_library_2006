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

  def test_books_should_be_empty_by_default
    assert_equal [], @author.books
  end

  def test_write_creates_a_book
    jane_eyre = @author.write("Jane Eyre", "October 16, 1847")

    assert_instance_of Book, jane_eyre
    assert_equal "Jane Eyre", jane_eyre.title
    assert_equal "1847", jane_eyre.publication_year
  end

  def test_write_adds_the_new_book_to_authors_books
    jane_eyre = @author.write("Jane Eyre", "October 16, 1847")

    assert_equal [jane_eyre], @author.books

    villette = @author.write("Villette", "1853")

    assert_equal [jane_eyre, villette], @author.books
  end
end
