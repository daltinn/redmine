#!/usr/bin/bash
#bundle install --without development test
#rake redmine:plugins:migrate RAILS_ENV=production

# bundle exec rake db:migrate:plugin NAME=scrum VERSION=0 RAILS_ENV=production
bundle exec rake redmine:plugins:migrate NAME=$1 VERSION=0 RAILS_ENV=production

echo "for compleate remove need remove folder"
echo "remove plugin folder? (y/n)"
read REMOVE
if [[ "$RESTART" = "y" || "$RESTART" = "Y" || "$RESTART" = "yes" || "$RESTART" = "YES" ]] ; then
        rm -rf $1
        echo "Nginx restarted"
else
        echo "Nginx not restarted"
fi

echo "Last step: restart Nginx? (y/n)"
read RESTART
if [[ "$RESTART" = "y" || "$RESTART" = "Y" || "$RESTART" = "yes" || "$RESTART" = "YES" ]] ; then
        sudo systemctl restart nginx.service
        echo "Nginx restarted"
else
        echo "Nginx not restarted"
fi
