---
tags:
  - osint
  - "#google-dorks"
  - "#bugbounty"
---

## Overview

> [Google Dorks](https://es.wikipedia.org/wiki/Google_Hacking) (also known as Google Hacking) is a technique used to find sensitive information using advanced Google search queries. It helps in penetration testing, [[Osint]] (Open Source Intelligence), and cybersecurity research.

## Basic Syntax

```bash
operator:value
```

- Operators help refine searches by targeting specific parameters.

---

## Common Google Dork Operators

### Site and Domain Filtering

```bash
site:example.com
```

- Searches within a specific site.

```bash
site:example.com filetype:pdf
```

- Finds PDFs on a given site.

```bash
site:gov intitle:"login"
```

- Looks for login pages on government websites.

### File Type Searches

```bash
filetype:pdf "confidential"
filetype:xls "password"
filetype:doc "internal use only"
```

- Finds documents with sensitive content.

### Index and Directory Listings

```bash
intitle:"index of" "parent directory"
```

- Finds open directory listings.

```bash
intitle:"index of" passwords
```

- Searches for password files in open directories.

### Login Pages and Admin Panels

```bash
inurl:admin
inurl:login
```

- Finds login and admin pages.

```bash
site:example.com inurl:admin
```

- Searches for admin pages on a specific domain.

### Exposed Databases and Credentials

```bash
intext:"sql dump" filetype:sql
```

- Finds publicly available SQL dumps.

```bash
inurl:"wp-config.php"
```

- Searches for exposed WordPress configuration files.

```bash
intext:"password" OR intext:"username"
```

- Finds pages containing login credentials.

### Security Cameras and IoT Devices

```bash
inurl:"/view.shtml"
inurl:"/webcam.html"
```

- Finds publicly accessible webcams.

### Vulnerable Websites

```bash
inurl:"php?id="
```

- Finds sites potentially vulnerable to SQL injection.

```bash
ext:log intext:"error" OR intext:"warning"
```

- Searches for error logs that may expose information.

---

## Best Practices

- Use responsibly and ethically.
- Avoid unauthorized access.
- Be aware of **Google's rate-limiting** if performing extensive queries.

---
## Other ways to use advanced google dorks searches
- Another way to use and find templates of dorks is [[Pentest Tools]] in this [link](https://pentest-tools.com/information-gathering/google-hacking)
