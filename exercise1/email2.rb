=begin
Change your class so that the initialize method now takes a subject string, and a headers hash. 
This is then more in line with how actual emails are stored in the real world: 
the values date and from are stored on a hash, which is called the “email headers".
##José_Arantes##
##n.º 8636##
##ESI_IPCA##
=end

class Email
  #Accessible attributes
  attr_accessor :subject, :date, :from
  
  def initialize(subject, email_header)  
    @subject = subject
    @date = email_header[:date]
    @from = email_header[:from]
  end
  
  def subject
    @subject end
  
  def date
    @date end
  
  def from
    @from end
end
  
  # Calls initialize
  email = Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Ferdous" })

  puts "Date:    #{email.date}"
  puts "From:    #{email.from}"
  puts "Subject: #{email.subject}"