class Library
  attr_reader :name, :books, :authors, :checked_out_books
  def initialize name
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author author
    @authors << author
    @books = @books.concat(author.books)
  end

  def publication_time_frame_for author
    pub_years = author.books.map(&:publication_year)
    {start: pub_years.min, end: pub_years.max}
  end

  def checkout book
    if(@books.include?(book))
      @checked_out_books << book
      @books = @books - [book]
      true
    else
      false
    end
  end
end
