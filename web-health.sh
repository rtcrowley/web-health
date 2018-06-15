#!/bin/bash

health=$(curl -m 5 -Is 127.0.0.1 |grep HTTP/1.1)

case "$health" in
  *200*)
        :
        ;;
  *500*)
        echo "Getting a 500 error on <SITE_NAME>" | mail -s "<SITE_NAME> 500 error" <MAIL_ADDRESS>
        ;;
   *)
        echo "Getting a non 200 response from <SITE_NAME>" | mail -s "<SITE_NAME> non 200" <MAIL_ADDRESS>
        ;;
esac
