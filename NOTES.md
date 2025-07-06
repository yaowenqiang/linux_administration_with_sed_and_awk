```bash

grep 'root' /etc/passwd
grep '^root' /etc/passwd
grep 'bash$' /etc/passwd
grep -c 'bash$' /etc/passwd
grep -c '/tcp' /etc/services

# count number of lines

grep -c '' /etc/services

```

> press <ESC>and . will get last argument

> AlmaLinux


> grep -E '/(udp|tcp)' /etc/services
> rg  '/(udp|tcp)' /etc/services

> grep -vE '/(udp|tcp)' /etc/services

> rg  -v '/(udp|tcp)' /etc/services

> grep -E '/(sctp|ddp)' /etc/services
> rg  '/(sctp|ddp)' /etc/services

> grep -vE '^(#|$)' /etc/services
> rg -v '^(#|$)' /etc/services

> rg -v '^(#|$)' /etc/ssh/sshd_config

## Search Many files

### File Globbing

> grep 'pam_motd' /etc/pam.d/*
> rg 'pam_motd' /etc/pam.d/*
> grep -l 'pam_motd' /etc/pam.d/*

> man pam_motd

> vim /etc/ssh/motd

> If you don't belong, don't stay

> vim /etc/pam.d/sshd

> motd

> !!

## IFS

> The default internal field separator(IFS) is white space. With a single space separated file, we can use the read command to populate the three fields used


```bash
echo 'Fred 23 Sales' >> employees.txt
echo 'Rahinda 22 It' >> employees.txt
while read name age dept; do
echo $name
echo $age
echo $dept
done < employees.txt

tr ' ' ',' < employees.txt >employees.csv

OLDIFS="$IFS"
IFS=','
while read namge age dept; do
echo $name
echo $age
echo $dept

done < employees.csv

IFS="$OLDIFS"
```

### /etc/passwd


```bash
OLDIFS="$IFS"
IFS=':'
while read n p u g c d st; do
echo -e "User:$n\n\tPass:$p\n\tUID: $u\n\tGID:$g\n\tComment:$c`n\tHOME:$d\n\tShELL:$s"

done < /etc/passwd

IFS="$OLDIFS"

```

## The stream editor

```bash


# line numbers
sed -n '1p' /etc/passwd
sed -n '$p' /etc/passwd
sed -n '20,$p' /etc/passwd
sed -n '20,22p' /etc/passwd

# appending

sed '$a 8.8.8.8 google ' /etc/hosts
sed -i '$a 8.8.8.8 google ' /etc/hosts

# delete last line
sed '$d' /etc/hosts

# insert before first line

sed '1i hello' /etc/hosts

# this will fail
sudo echo '8.8.8.8 google' >> /etc/hosts

vim +1 file
nvim +1 file

nvim +$ file


```

## Using Strings and Regular Expressions

```bash
apt install git
apt install git
zypper in git-core

sed -n '/ServerNmae/p' vhost.template

sed -i 's/dummy-host.example.com/www.example.com/p' vhost.template

sed -E '/^(#|$)/d' vhost.template
sed -E '/^\s*(#|$)/d' vhost.template
sed -E '/^\s*(#|$)/d' vhost.template > ./vhost.template1

vim +/ServiceNae/ mvhost.template

alias cleanfile="sed -E '/^\s*(#|$)/d' "

cleanfile chrony.conf

unalias cleanfile



```

### Prniting Blockso Text

```bash

sed -n '/<directory/,/<\/Directory/p' vhost.template
sed -nE  "/<Directory/,/<\/Directory/p" vhost.template  | sed -E '/^\s*(#|$)/d'

```
```bash
for f in ~/Code/linux_project/sed-and-awk/scripts/*.sh;do
  firstline=$(sed -n '1p' $f)
  if [[ $firstline != "#!"* ]]; then
      echo "Adding shebang to $f"
      sed -i '1i #!/bin/bash' $f
  fi
done

```

### Using sed files

```bash
sed '/^$/d;/^#/d' sshd_config

sed -f simple.sed sshd_config
sed -f simple.sed  -i.bak sshd_config

```

```sed

#!/bin/sed -Ef

/ClientAliveInterval/ {
    s/^(ClientAlivetInterval).*$/\1 60/
    t count # t means move to
    s/.*/ClientAlivetInterval 60/
    t count
}
:count
/ClientAliveCountMax/  {
    s/^(ClientAliveCountMax).*$/\1 3/
    t del
    s/.*/ClientAliveCountMax 3/
    t del
}

:del
/^(#|$)/d
```
···bash
echo '127.0.0.1' > server.txt
while read server； do
echo $Starting work on $server"
ssh -n -C -o StrictHostKeyChecking=no $server "sudo sed -Ei.$(date +%F) '/(#|$)/d' /etc/ssh/sshd_config"
echo "Finished work on $server"
done < server.txt
```

### Remote SSH Commands

Using ssh and -C we can execute commands remotely without the need of an interactive session. The option -n is used to redirect stdin to /dev/null, allowing remote execution of commands on more than one server


```bash
ssh -n -o StrictHostKeyChecking=no
```

## Awk 

```bash
awk -F: '{print $0}' /etc/passwd
awk -F: '{print NR ":" $0}' /etc/passwd
awk -F: '/bash$/{print NR ":" $0}' /etc/passwd
awk -F: '/bash$/{printf "%2d%s%s\n", NR, ": ", $0}' /etc/passwd
awk -F: '/bash$/{printf "%2d%s%s%6d\n", NR, ": ", $1, $3}' /etc/passwd
awk -F: '{printf "%2d%s%22s%6d\n", NR, ": ", $1, $3}' /etc/passwd
awk 'BEGIN{FS=":"; printf "%4s%20s%6s\n", "Num:", "Username", "UUID"} {printf "%2d%s%22s%6d\n", NR, ": ", $1, $3}' /etc/passwd

awk 'BEGIN{FS=":"; printf "%4s%20s%6s\n", "Num:", "Username", "UUID"; COUNT=0} {COUNT++;printf "%2d%s%22s%6d\n", NR, ": ", $1, $3}' /etc/passwd

awk 'BEGIN{FS=":"; printf "%4s%20s%6s\n", "Num:", "Username", "UUID";COUNT=0} !/^#/{COUNT++;printf "%4s%s%22s%6d\n", COUNT, ": ", $1, $3}' /etc/passwd

awk 'BEGIN{FS=":"; printf "%4d%20s%6s\n", "Num:", "Username", "UUID";COUNT=0} !/^#/{COUNT++;printf "%4d%s%22s%6d\n", COUNT, ": ", $1, $3} END {print "We have " NR " users, of which " COUNT " use BASH"}' /etc/passwd

```

print will add a newline
printf should add a '\n'

### awk file

```awk
# test.awk

BEGIN {
  print "This is the start"
}
{
  print $0;
}

END {
  print "This is the end"
}

```

```bash

awk -f test.awk /etc/passwd


```

### lastlog formatting

exclude certain lines from being processed


```awk
!(/Never logged in/ || /^Username/ || /^root/ ) {

}

```

```bash
chmod +x lastlog.awk
lastlog | ./lastlog.awk

```

## Filtering Data from Differing Text File Formats


```bash
awk 'BEGIN {FS=":"; OFS=","}{print $1, $3, $4, $6, $7}' /etc/passwd

```


```bash
awk -f -v pattern=root passwd2yaml.awk
# v menas variable pattern is the name of the variables

```

```bash
# append a newline to </VirtualHost
/a \ 
sed -E  '/^\s*$/d;/^<\/Virt/a \ ' vh.conf


```

### Working with the RS Variable

The variable RS is the record separator, This is normally a new line, but we wnat to be the extra new line  between each virtual host record


> brew install gawk
> awk -v pattern=example  -f virtualhost.awk vh.conf

## Read data from log files

### journalctl

```
journalctl -u ssh
journalctl -u ssh -g 'Failed password for invalid user'
journalctl -u ssh -g 'Failed password for root from '

```
> journalctl -u ssh | awk -f ssh-dimple.awk
> journalctl -u ssh | awk -f ssh-dimple.awk | sort -u


### Sorting Using AWK

The asorti function is an internal function in awk that sorts the indices of an array numerically or lexicographically and returns the number of elements in the sorted way

> vim 
> set bg=dark



## Blocking IPs

if you want to assume theses Ip address should not be on our system we could block each IP with a firewall. We may want to double check that our own IP is not included. but this shows the use of AWK and filtering



```bash


suso apt install firewalld

for i in $(sudo journalctl -u ssh | awk -f ssh-final.awk); do
    sudo firewall-cmd --zone=drop --add-source=$i
done

firewall-cmd --zone=drop --list-all

```


