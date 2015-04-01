=begin
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

class MailboxTextFormatter
  attr_accessor :mailbox
  def initialize(mailbox)
    @mailbox= mailbox
  end
  
  def box_format
    ns = number_subject(mailbox)  #nº de emails
    ms = max_subject(mailbox)     #comprimento max. de todos subject
    mf = max_from(mailbox)        #comprimento max. de todos from
    md = max_date(mailbox)        #comprimento max. de todos date
    
    puts "MAILBOX: #{@mailbox.name}\t" + "Emails: #{ns}"
    puts ("-"*(ms+mf+md)) + "-"*(5) 
    puts "|Date" + (" "*(md-3)) + "From" + (" "*(mf-3)) + "Subject" + (" "*(ms-6)) + "|"
    puts ("-"*(ms+mf+md)) + "-"*(5) 
   
    @mailbox.emails.each do |email|
      box_date=email.date
      box_from=email.from
      box_subject=email.subject
        print "|#{box_date}" + (" "*(md-box_date.length+1)) 
        print "#{box_from}" + (" "*(mf-box_from.length+1))
        print "#{box_subject}" + (" "*(ms-box_subject.length+1)) + "|"
        puts
    end
    puts ("-"*(ms+mf+md)) + "-"*(5) 
    
  end
  
  #Comprimento do maior subject
  def max_subject(mailbox)
    x = 0
    mailbox.emails.each do |email|
      while email.subject.length > x do
        x = email.subject.length
      end
    end
    return x
  end

  def max_date(mailbox)
    x = 0
    mailbox.emails.each do |email|
      while email.date.length > x do
        x = email.date.length
      end
    end
    return x
  end

  def max_from(mailbox)
    x = 0
    mailbox.emails.each do |email|
      while email.from.length > x do
        x = email.from.length
      end
    end
    return x
  end

  #  Nº de mails
  def number_subject(mailbox)
    x = 0
    mailbox.emails.each do |email|
      x +=1
    end
    return x
  end

end  

emails = 
  [
  Email.new("Homework this week!", { :date => "2014-12-01", :from => "Ferdous" }),
  Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week!", { :date => "2014-12-02", :from => "Ariane" })
  ]

mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxTextFormatter.new(mailbox)

puts formatter.box_format

