# Otomasi-zabbix

This project provides a fully automated deployment of Zabbix using Docker, including automatic configuration via API.

## 🚀 Features

•⁠  ⁠One-command deployment
•⁠  ⁠Auto install Docker
•⁠  ⁠Auto deploy Zabbix
•⁠  ⁠Auto create host group
•⁠  ⁠Auto add MikroTik device via SNMP

---

## 📁 Project Structure


zabbix-auto/
├── docker-compose.yaml
├── install.sh
├── .env
├── scripts/
│   ├── init.sh
│   └── zabbix_api.sh


---

## ⚙️ Requirements

•⁠  ⁠Ubuntu Server 20.04 / 22.04 / 24.04
•⁠  ⁠Internet access

---

## ▶️ Deployment

⁠ bash
git clone https://github.com/rizkyawallalu-png/Otomasi-zabbix.git
cd zabbix-auto
chmod +x install.sh
./install.sh
 ⁠

---

## 🌐 Access


http://<VM-IP>:8080


Login:

•⁠  ⁠Username: Admin
•⁠  ⁠Password: zabbix

---

## 📡 MikroTik Setup

Enable SNMP:


/snmp set enabled=yes
/snmp community add name=zabbix-snmp addresses=<zabbix-server-ip>


---

## ⚠️ Notes

•⁠  ⁠Wait 30–60 seconds after deployment
•⁠  ⁠Ensure VPN / network connectivity
•⁠  ⁠Change default password after login

---

## 🏁 Conclusion

This project simplifies Zabbix deployment into a single command with full automation, suitable for lab, production, and monitoring environments.
