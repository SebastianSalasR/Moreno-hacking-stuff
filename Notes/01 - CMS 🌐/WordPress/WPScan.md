---
tags:
  - web
  - "#wordpress"
  - "#tools"
  - "#scan"
---
---
The **WPScan**[^1] tool is commonly used to list pages that use [[WordPress]] as a CMS.

It's very easy to use. We can make a test scan using this command:

```shell
wpscan --url https://humanidades.uach.cl/
```

If we want to enumerate potential users within this CMS, we can use this command:
```shell
wpscan --url https://humanidades.uach.cl/ --enumerate u
```

Another of usage of this tool it's that we can make fuzzing to discover valid credentials in the login panels
```zsh
wpscan --url https://humanidades.uach.cl/ -U moreno -P /usr/share/wordlists/rockyou.txt
```
It's worth to mention that this procedure, it can also be made by hand[^2] abusing of the **xmlrpc.php** file, making a python script for instance.

---
 ## References
 
 [^1]: [Github Repo](https://github.com/wpscanteam/wpscan)
 [^2]:Manual procedure using [[XMLRPC]]
 