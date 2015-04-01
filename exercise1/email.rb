=begin
In a new file email.rb write a class Email that has a subject, date, and from attribute. 
Make it so that these attributes can be populated through new and initialize.
##José_Arantes##
##n.º 8636##
##ESI_IPCA##
=end

class Email
  #Accessible attributes
  attr_accessor :subject, :date, :from
  
  def initialize(subject, date, from)  
    @subject = subject
    @date = date
    @from = from
  end
  
  def subject
    @subject end
  
  def date
    @date end
  
  def from
    @from end
end

  # Calls initialize
  email = Email.new("Homework this week", "2014-12-01", "Ferdous")

  puts "Date:    #{email.date}"
  puts "From:    #{email.from}"
  puts "Subject: #{email.subject}"