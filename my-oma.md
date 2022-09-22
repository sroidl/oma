# bash: prepend line
Usage of command grouping (not efficient on large files!)
```bash
# the {} collect all output from commands inside. we then send into file.new
{ echo '<added text> '; cat file; } >file.new
# override file with contents of file.new
mv file{.new,}
```


# bash: switch case in bash
```bash
case $VAR in
  PATTERN)
	<commands here>
  ;;
  PATTERN2|PATTERN3)
	<commands here>
  ;;
  *)
	<commands here>
  ;;
esac
```

First case matches PATTERN, second case matches both patterns, *-case is the default if nothing else matches.
[source](https://linuxize.com/post/bash-case-statement/)

# vim: open vim in edit mode
```bash
vim -c 'startinsert' /tmp/foo 
```

# vim: open vim in specific line
```bash
vim /tmp/foo +45 
```
opens /tmp/foo in line 45


# 22-09-22 oma: oma.app feature ideas
created by basti on 2022-09-22

* dynamic subdomain that resolves to my user, e.g. curl basti.oma.app/bash translates to curl oma.app/basti/bash

# 22-09-22 oma: oma-wrapper
Some bash script that helps using oma.app. To use it, store it in $HOME/.oma/oma.sh and link it in your preferred bin folder.
For example `ln -s $HOME/.oma/oma.sh /usr/local/bin`
You can provide an oma.conf file in $HOME/.oma and set a OMA_USER variable there. By default, oma.sh will then query only learnings by this user.

 
   
