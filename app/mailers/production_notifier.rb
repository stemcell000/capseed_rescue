class ProductionNotifier < ActionMailer::Base

    include SendGrid
  default from: "idv.org"
  
  def notify_closed_production(production)
    
    recipients = User.where( :role => [ "administrator" ]).pluck(:email)
    firstnames = User.where( :role => [ "administrator" ] ).pluck(:firstname)
    sendgrid_category "Notification"
          @production = production

    if Rails.env.production?
      sendgrid_recipients recipients
      sendgrid_unique_args :key => production.id
      
      mail :from => "mailer@capseed.com", :to => "noreply@address.com", :subject => "Production ##{production.id} is closed."
    else
      mail :from => "mailer@capseed.com", :to => recipients, :subject => "Production ##{@production.id} is closed."

    end
  end

end
