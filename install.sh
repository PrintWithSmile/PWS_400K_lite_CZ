cd /home/pi/PWS
sudo git clone https://github.com/PrintWithSmile/PWS_400K_lite_CZ.git


sudo nano /home/pi/PWS/PWS_400K_lite_CZ/.git/hooks/post-merge

#!/bin/sh
rm /home/pi/PWS/update_conf.sh
cp -f /home/pi/PWS/PWS_400K_lite_CZ/update.sh /home/pi/PWS/update_conf.sh
cd /home/pi/PWS
chmod +x update_conf.sh 
./update_conf.sh

sudo chmod +x /home/pi/PWS/PWS_400K_lite_CZ/.git/hooks/post-merge

sudo nano /home/pi/PWS/update_conf.sh

xxxxx

sudo chmod +x /home/pi/PWS/update_conf.sh

cd /home/pi/printer_data/config/
sudo mkdir /home/pi/printer_data/config/PWS_config
sudo mkdir /home/pi/printer_data/config/Archive
sudo rm moonraker.conf
sudo rm crowsnest.conf
sudo rm printer.cfg
sudo cp /home/pi/PWS/PWS_400K_lite_CZ/printer.cfg /home/pi/printer_data/config/
sudo cp /home/pi/PWS/PWS_400K_lite_CZ/crowsnest.conf /home/pi/printer_data/config/
sudo cp /home/pi/PWS/PWS_400K_lite_CZ/moonraker.conf /home/pi/printer_data/config/
sudo cp /home/pi/PWS/PWS_400K_lite_CZ/Konfigurace/* /home/pi/printer_data/config/PWS_config/
sudo chown -R pi:pi /home/pi/PWS
sudo chown -R pi:pi /home/pi/printer_data/config
sudo service klipper restart
sudo service moonraker restart
