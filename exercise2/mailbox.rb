=begin
In a new file mailbox.rb write a class that has a name and emails attribute. 
Make it so that the these attributes can be populated through the initialize method.
(name being a string, and emails being an array of Email instances).
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

class Mailbox
  #Accessible attributes
  attr_accessor :name,:emails
  def initialize(name, emails)
    @name= name
    @emails=emails
  end
end

emails = [
  Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
  Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)

mailbox.emails.each do |email|
  puts "Date:    #{email.date}"
  puts "From:    #{email.from}"
  puts "Subject: #{email.subject}"
  puts
end