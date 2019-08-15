class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def new_attendee_email(event, attendee)
    @event=event
    @admin=@event.admin
    @attendee=attendee
    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 
    mail(to: @admin.email, subject: 'A new registration for your event')  # Carsano avait mis @admin.email, mais ça m'affichait une erreur du coup.. Donc j'ai fait remplacé par @user, et ça a fonctionné.. J'ai passé 1h dessus.. Finalement j'ai tt rechangé et ai mis comme lui.
  end

end
