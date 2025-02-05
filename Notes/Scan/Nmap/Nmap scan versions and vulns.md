---
tags:
  - nmap
  - scripts
  - "#recognition"
  - ports
---
---
If we do:
```shell
locate .nse
```
We see that there are a lot scripts related to nmap that are used to list versions and vulnerabilities.

In total, there are 606
```shell
locate .nse | wc -l
```
---
### `-sC` & `-sV`: Service and Script Scanning

The `-sC` and `-sV` options in Nmap are used to **gather detailed information about services running on open ports**. These scans help identify software versions and detect vulnerabilities.

## 🔹 **`-sV`: Version Detection**

The `-sV` option probes open ports to **determine the exact software and version** running on them.  
Example:

```bash
nmap -sV target.com
```

🔹 **Use case**: Helps detect outdated or vulnerable services.

## 🔹 **`-sC`: Default Script Scan**

The `-sC` option runs **Nmap’s default scripts** (equivalent to `--script=default`), which gather additional service details like SSL certificate info, anonymous FTP access, and more.  
Example:

```bash
nmap -sC target.com
```

🔹 **Use case**: Automates basic reconnaissance.

## 🔹 **Combining `-sC` & `-sV`**

These options are often used together for **in-depth scanning**:

```bash
nmap -sC -sV target.com
```

✔ Identifies **software versions**.  
✔ Runs useful **scripts** for additional info.

## ✅ **Advantages**

✔ **Provides detailed service info**.  
✔ **Helps detect misconfigurations & vulnerabilities**.  
✔ **Works well with other scans (`-p`, `-A`, etc.)**.

## ❌ **Disadvantages**

✖ **More intrusive**—may trigger IDS/IPS alerts.  
✖ **Slower** than basic port scanning.

## 🔍 **Final Thoughts**

`-sC -sV` is ideal for **detailed reconnaissance**, especially when combined with **port specification (`-p`)** for targeted scans. 🚀

---
To see the categories of the scripts, we use:
```shell
locate .nse | xargs grep "categories"
```
or
```shell
locate .nse | xargs grep "categories" | grep -oP '".*?"'
```