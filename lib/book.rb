class Book
  attr_reader :title
  def initialize data
    @title = data[:title]
    @author_first_name = data[:author_first_name]
    @author_last_name = data[:author_last_name]
  end

  def author
    @author_first_name + " " + @author_last_name
  end
end
