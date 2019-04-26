# Pi Switch
******************************************
**Switch On/Off Service  For RaspberryPi**  
******************************************
Safe Starting And Shutting Down Of RaspberryPi Using A PushButton
1.Download Requirements
```

2. Run the installer.
```
sudo chmod +x /home/${USER}/Switch/installer.sh  
sudo /home/${USER}/Switch/installer.sh  
```
2. Wire The RaspberryPi As Shown In the Diagram.  
3. Start The On/Off Service.  
```
sudo systemctl start on-off-pushbutton.service
```
