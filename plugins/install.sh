#!/usr/bin/bash
bundle install --without development test
rake redmine:plugins:migrate RAILS_ENV=production
echo "Migrate db"
bundle exec rake db:migrate RAILS_ENV=production


echo "Restart Nginx? (y/n)"
read RESTART
if [[ "$RESTART" = "y" || "$RESTART" = "Y" || "$RESTART" = "yes" || "$RESTART" = "YES" ]] ; then
	sudo systemctl restart nginx.service
	echo "Nginx restarted"
else
	echo "Nginx not restarted"
fi
