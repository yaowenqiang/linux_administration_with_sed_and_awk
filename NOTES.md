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

```

