# 22-09-22 oma: oma.app feature ideas
created by basti on 2022-09-22

* dynamic subdomain that resolves to my user, e.g. curl basti.oma.app/bash translates to curl oma.app/basti/bash

# 22-09-22 oma: oma-wrapper
Some bash script that helps using oma.app. To use it, store it in $HOME/.oma/oma.sh and link it in your preferred bin folder.
For example `ln -s $HOME/.oma/oma.sh /usr/local/bin`
You can provide an oma.conf file in $HOME/.oma and set a OMA_USER variable there. By default, oma.sh will then query only learnings by this user.

 
   
