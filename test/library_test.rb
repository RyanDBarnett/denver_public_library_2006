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

  def test_no_checked_out_books_by_default
    assert_equal [], @library.checked_out_books
  end

  def test_add_author
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})

    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    @library.add_author(charlotte_bronte)
    @library.add_author(harper_lee)

    assert_equal [charlotte_bronte, harper_lee], @library.authors
    assert_equal [jane_eyre, professor, villette, mockingbird], @library.books
  end

  def test_publication_time_frame_for_given_author
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})

    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = charlotte_bronte.write("The Professor", "1857")
    villette = charlotte_bronte.write("Villette", "1853")
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    @library.add_author(charlotte_bronte)
    @library.add_author(harper_lee)

    assert_equal({:start=>"1847", :end=>"1857"}, @library.publication_time_frame_for(charlotte_bronte))
    assert_equal({:start=>"1960", :end=>"1960"}, @library.publication_time_frame_for(harper_lee))
  end

  def test_cannot_checkout_book_if_book_not_in_library
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})

    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    assert_equal false, @library.checkout(jane_eyre)
    assert_equal false, @library.checkout(mockingbird)
  end

  def test_cannot_checkout_book_if_book_not_in_library
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})

    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

    @library.add_author(charlotte_bronte)
    @library.add_author(harper_lee)

    assert_equal true, @library.checkout(jane_eyre)
    assert_equal true, @library.checkout(mockingbird)
  end
end
