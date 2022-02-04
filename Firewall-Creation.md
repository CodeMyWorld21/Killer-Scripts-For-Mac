# How to Install & Configure Mac Firewall for Safety
I will explain in detail how to download firewall on your mac.

### First Dowmload the (UFW) from brew
Ufw is secure and versatile.

```bash
brew install ufw
```

### Configure UFW
First Enable the Firewall for use
```bash
ufw enable
```
Next check the status of the firewall for errors
```bash
ufw status
```
Refer to "https://www.digitalocean.com/community/questions/ubuntu-ufw-firewall-not-working-at-all"
for debugging

afterwards configure any desired ports with this command:
```bash
ufw allow <port>
ufw deny <port>
ufw list
```
make sure to use sudo privalages for more profound use
