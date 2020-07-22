class Author
  attr_reader :books
  def initialize data
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @books = []
  end

  def name
    @first_name + ' ' + @last_name
  end
end
