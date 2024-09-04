#!/bin/sh
# get user
user = $1
# add user, create a new home for user and new password
sudo adduser --ingroup sudo --home /home/$user --shell /bin/bash $user && passwd -e $user
# refresh shell
newgrp sudo
