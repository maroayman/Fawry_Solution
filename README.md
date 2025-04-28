# Troubleshooting Guide: Internal Web Dashboard Unreachable

## Overview
This guide helps diagnose and resolve issues where the internal web dashboard (`internal.example.com`) is unreachable, despite the service appearing to be running.

---

# 1. Verify DNS Resolution
Check if the hostname resolves correctly using the configured DNS server and compare it against Google's public DNS (8.8.8.8).

### **Commands**
```bash
nslookup internal.example.com
dig internal.example.com
nslookup internal.example.com 8.8.8.8
dig @8.8.8.8 internal.example.com
cat /etc/resolv.conf # To see the configured DNS servers
```

# 2.Diagnose Service Reachability

This section describes the steps to verify whether the internal web service (`internal.example.com`) running on port 80 (HTTP) or port 443 (HTTPS) is reachable and responsive.

---

## 1. Verify HTTP/HTTPS Responses

Use `curl` to check if the web service is returning a valid response:

```bash
curl -I http://internal.example.com
curl -I https://internal.example.com
```
## 2. Test Port Availability with Telnet
```bash
telnet internal.example.com 80
telnet internal.example.com 443
```
## 3. Determine if the service is actively listening on required ports.
### Using Netstat:
```bash
netstat -tulnp | grep LISTEN
```
### Using SS (Socket Statistics):
```bash
ss -tulnp | grep LISTEN
```
## 4.What to Do if Issues Are Found

### Restart the Web Service
 If the service is running but not responding, restart it:
```bash
systemctl restart apache2  # Apache  
systemctl restart nginx    # Nginx
```
### Check Firewall Rules
```bash
iptables -L
ufw status
```
### Verify Network Configuration
```bash
ip route show
traceroute internal.example.com
```
