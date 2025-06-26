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


