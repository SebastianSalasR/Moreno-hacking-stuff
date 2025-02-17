---
tags:
  - "#http"
  - "#https"
  - "#ssl"
  - "#whatweb"
  - "#ffuf"
  - "#certificate"
  - "#heartbleed"
---
---
#http #https #security #pentesting #ssl #certificate #whatweb #ffuf
## 1. Analyzing HTTP Services

### a) Identifying Technologies with WhatWeb

`WhatWeb` is a tool used to detect web technologies and services running on a target website:

```bash
whatweb <target-url>
```

Example:

```bash
whatweb http://example.com
```

This command provides details about the web server, framework, CMS, and other components.

### b) Fuzzing HTTP Endpoints with FFUF

[[Ffuf]] can be used for fuzzing web applications to discover hidden directories, parameters, and vulnerabilities.

---

## 2. Analyzing HTTPS Certificates

### a) Viewing the Certificate in a Browser

To check an HTTPS certificate in a web browser:

1. Click the **padlock** icon in the address bar.
2. Select **View Certificate** (varies by browser).
3. Check details like issuer, expiration date, and encryption strength.

### b) Viewing the Certificate with OpenSSL

To retrieve and display an HTTPS certificate using OpenSSL:

```bash
openssl s_client -connect <target-url>:443 -showcerts
```

Example:

```bash
openssl s_client -connect example.com:443 -showcerts
```

This command fetches the SSL certificate directly from the server.

### c) Analyzing SSL Certificates with SSLScan

`SSLScan` provides a detailed security analysis of SSL/TLS configurations:

```bash
sslscan <target-url>
```

Example:

```bash
sslscan example.com
```

It checks for weak ciphers, supported protocols, and vulnerabilities.

---
## 3. Practical Example: Detecting [[HEARTBLEED]] Vulnerability

### a) Setting Up a Vulnerable SSL Server

Clone the Vulhub repository that contains a vulnerable OpenSSL setup:

```
git clone https://github.com/vulhub/vulhub.git
cd vulhub/openssl/CVE-2014-0160
docker-compose up -d
```

This starts a Docker container with an OpenSSL version vulnerable to the **Heartbleed attack**.

### b) Scanning the SSL Certificate with SSLScan

After starting the container, analyze its SSL/TLS security:

```
sslscan 127.0.0.1:443
```

If the server is vulnerable, SSLScan will indicate weak ciphers and Heartbleed vulnerability.

### c) Detecting Heartbleed with Nmap

Nmap has a script to check for Heartbleed vulnerabilities:

```
nmap --script ssl-heartbleed -p 8443 127.0.0.1
```

If the scan confirms vulnerability, it means the SSL certificate is susceptible to **Heartbleed**, which allows attackers to extract sensitive data from memory.