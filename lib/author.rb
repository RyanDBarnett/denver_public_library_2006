class Author
  def initialize data
    @first_name = data[:first_name]
    @last_name = data[:last_name]
  end

  def name
    @first_name + ' ' + @last_name
  end
end
