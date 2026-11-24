# IZ2S ARM Input · 1.1.1

The Linux input agent serves SmileBASIC 4. It exposes a USB keyboard and a
Switch-compatible controller. The PC supplies the input plan.

## Requirements

- Linux, Python 3, systemd, root access and SSH with a trusted host key.
- A working USB device/OTG controller, configfs and the kernel libcomposite/HID
  gadget driver. A USB-C socket alone does not guarantee device-mode support.
- LAN between PC and ARM. Use the board's USB data/OTG port for the Switch dock.

The package runs on the input board, not on Switch. No Node.js server is needed
on ARM. The installer cannot provide missing board firmware or enable an
unsupported USB device controller.

## Install from the panel

Select ARM PC, open Device settings and enter its IPv4 address, root SSH account
and optional private-key path. Verify the host fingerprint through the board's
own console first. To enable existing SSH key access from the PC:

```sh
ssh root@ARM_IP
ssh-copy-id root@ARM_IP
```

Keep passwords in the terminal. The panel uses strict host-key checking and
never uploads a private key. Confirm the installation target and choose Install
package. Installation deploys the checksum-verified package, prepares the USB
keyboard/controller and enables iz2s-usb.service and iz2s-discovery.service.
It sends no button presses or keyboard commands.

The composite gadget uses the same separate HORI gamepad and boot-keyboard HID
reports as ADV. Configfs hidg device numbers are discovered during binding;
input-config.json records their roles. Existing HID-only gadget definitions are
preserved and their previous binding is restored if setup fails. USB gadgets
with network, storage or other functions are refused before any unbinding.
Use a separate/dedicated USB controller for those boards. Keep OS-specific USB
autostart scripts from rebinding the same controller after iz2s-usb.service.

## Manual or password-only installation

Download the ARM installer from Device settings. Copy
iz2s-arm-input.run onto the ARM device:

```sh
scp iz2s-arm-input.run USER@ARM_IP:/tmp/
ssh USER@ARM_IP
sudo python3 /tmp/iz2s-arm-input.run
```

The installer contains the verified keyboard + controller agent. It
needs only Python 3 and works without downloading anything on ARM. It verifies
all embedded files before installation. `--check` checks the board without
installing; `--check-package` checks only the embedded files on any PC. Do not
run the installer on the server PC unless it is itself the USB input board.
The ordinary iz2s-arm-input.tar.gz package with install.py remains available
for existing deployment scripts and SSH installation.

Use the same target folder in the panel. Offline copying by USB storage also
works. If the board only supports a pre-existing keyboard setup, --keyboard-only
keeps it for SmileBASIC.

## Connect and run

Connect ARM USB data/OTG to Switch and check the keyboard connection.
Plans use distinct job IDs and
owned transient systemd services. A lost receipt/restart never replays a line.
STOP releases both interfaces. Controller neutral reports continue while the
keyboard types. The keyboard LED response is checked before text entry.

## Troubleshooting and removal

SSH connection refused means no SSH service accepts that connection. Start the
board's existing ssh/sshd service locally; changing keys does not solve it.
No USB controller/configfs means the board OS needs its vendor-specific gadget
setup before installation. A successful SSH connection does not prove USB input.

After stopping input, disable iz2s-discovery.service, then stop/disable
iz2s-usb.service. Its stop action restores the saved previous HID binding.
Remove only those two service files and the dedicated installation folder,
then run systemctl daemon-reload. Leave system SSH, drivers and foreign gadget
definitions intact. Discovery UDP 39418 carries public metadata only; SSH is
the authenticated command channel.

Protocol sources: [Linux HID gadget](https://docs.kernel.org/usb/gadget_hid.html),
[configfs](https://docs.kernel.org/usb/gadget_configfs.html),
[original CivSwitch HID descriptors](https://github.com/Gezine/CivSwitch).
Physical ARM/Switch recognition still requires a hardware test.
