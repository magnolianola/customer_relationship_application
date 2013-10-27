class Rolodex
	@contacts = []
	@id = 1000

	def self.add_contact(contact) #self means that this is a class method. not an instance method.
		contact.id = @id
		@contacts << contact
		@id += 1
	end

	def self.contacts
		@contacts
	end

	def add_new_contact
		print "Enter First Name: "
		first_name = gets.chomp
		print "Enter Last Name: "
		last_name = gets.chomp
		print "Enter Email Address: "
		email = gets.chomp
		print "Enter a Note: "
		note = gets.chomp
		contact = Contact.new(first_name, last_name, email, note)
	end
end

