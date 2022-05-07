---
title: Headless raspberry pie
---

# Headless setup of Raspberry pie

## Installing Raspberry Pi OS on Your microSD card

1. **Insert a microSD card** into your computer. Your card should be 8GB or larger (the lite version of Raspberry Pi OS will use less space). We have a list of the [best microSD cards](https://www.tomshardware.com/best-picks/raspberry-pi-microsd-cards) for Raspberry Pi to help you choose one that optimizes performance.

2. **Download, install and run** [**Raspberry Pi Imager**](https://www.raspberrypi.org/downloads/)**.** 

3. **Click the Choose OS button.** A menu appears.
4. Follow the instruction
5. **Write an empty text file named "ssh"** (no file extension) to the root of the directory of the card. When it sees the "ssh" on its first boot-up, Raspberry Pi OS will automatically enable SSH (Secure Socket Shell), which will allow you to remotely access the Pi command line from your PC.
6. **Configure a network connection** for your Raspberry Pi. Though you've enabled SSH, which will let you log in and issue terminal commands, you still need a way to actually reach your Pi. You can connect via Wi-Fi / Ethernet, direct Ethernet connection or direct USB connection (Pi Zero only). Here are instructions for each.


## Headless Wi-Fi / Ethernet

To setup a Wi-Fi connection on your headless Raspberry Pi, create a text file called `wpa_supplicant.conf`, and place it in the root directory of the microSD card. You will need the following text in the file.

```bash
country=US
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
scan_ssid=1
ssid="vikas5G"
psk="11**33"
}
```


## Direct Ethernet Connection

If your PC has a spare Ethernet port or you have an Ethernet-to-USB dongle, you can use a network cable to go directly from your Pi to your computer. Just make sure that you have Bonjour installed on your PC and SSH enabled on the Pi (see above). Then, you can just connect the two devices over Ethernet.

If you want the Raspberry Pi to get its Internet connection from your PC over the Ethernet port, you need to do the following in [Windows 10](https://www.tomshardware.com/reviews/get-windows-10-free-or-cheap,5717.html):

1. **Navigate to the Network Connections menu**, which is part of the old-school Control Panel. You can get to this screen by going to Settings->Network & Internet->Wi-Fi and then clicking "Change Adapter Settings" on the right side of the screen. This works whether you are sharing an Internet connection that comes to your PC from Wi-Fi or from Ethernet.


## Connecting over ssh

After you have the Pi connected to your network or directly to your PC, you'll need to establish an SSH connection.

2. **Enter**  _raspberrypi_ **or** _**raspberrypi.local**_ as the address you wish to connect to in Putty, and **click Open**. You usually need to add the .local if the Pi is directly connected to your PC via USB or Ethernet cable.


```bash
HOST raspberrypi
PORT 22
```

## Enabling and Connecting over VNC

**1. Enter** _**sudo raspi-config**_ at the command prompt.


## References

[blog](https://gallaugher.com/makersnack-setup-a-raspberry-pi-without-a-keyboard-or-mouse-headless-install/)

<iframe width="560" height="315" src="https://www.youtube.com/embed/hCxT0A-5_9k" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


