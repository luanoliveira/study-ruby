require 'mail'
require 'dotenv'
require 'erb'

Dotenv.load

class Form 
    # attributes
    def self.attributes
        @attributes
    end
        
    def self.attribute(name, value=nil, label=nil)
        if !defined? @attributes
            @attributes = []
        end

        @attributes.push({
            name: name,
            value: value,
            label: label
        })
    end

    # validations
    def self.validations
        @validations ||= {}
    end

    def self.validate(attribute, *validations)
        if !defined? @validations
            @validations = {}
        end

        @validations[attribute] = validations
    end

    def validate?
        validate = true

        self.class.attributes.each do |attribute|
            validations = get_validations(attribute[:name])            
            
            if !validations.nil?   
                validations.each do |validate_rule|
                    case validate_rule
                    when :not_blank
                        validate = !attribute[:value].nil?
                    end
                end
            end
        end

        validate
    end
    
    def get_validations(attribute)
        if self.class.validations.has_key? attribute
            self.class.validations[attribute]
        end
    end
end

class Contact < Form
    attribute :name, "Luan Oliveira", "Nome"
    attribute :email, "teste@gmail", "E-mail"
    attribute :phone, "8499999999", "Telefone"

    validate :name, :not_blank
    validate :phone, :not_blank

    def send
        if validate?
            # send contact
    
            view = ERB.new(File.read('views/mail.erb'))

            attributes = self.class.attributes
            puts attributes.inspect

            mail = Mail.new do
                from     'luanconecte@gmail.com'
                to       'luanconecte@gmail.com'
                subject  'Here is the image you wanted'
                content_type 'text/html; charset=UTF-8'
                body     view.result_with_hash(attributes: attributes)
            end

            mail.delivery_method :smtp, { 
                :address              => ENV['SMTP_HOST'],
                :port                 => ENV['SMTP_PORT'],
                :user_name            => ENV['SMTP_USER'],
                :password             => ENV['SMTP_PASSWORD'],
                :authentication       => :plain,
                :enable_starttls_auto => true
            }
            
            mail.deliver!
        else
            false
        end
    end
end

#puts Contact.attributes.inspect
#puts Contact.validations.inspect

contact1 = Contact.new
#puts contact1.validate?
contact1.send


#contact1 = Contact.new
#puts contact1.attributes