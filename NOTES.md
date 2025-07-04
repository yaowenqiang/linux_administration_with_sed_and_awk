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
