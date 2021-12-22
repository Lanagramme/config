wpa_passphrase "Galaxy Tab S7B2CA" luse0047 | sudo tee /etc/wpa_supplicant.conf
sudo wpa_supplicant -c /etc/wpa_supplicant.conf -i wlan0

