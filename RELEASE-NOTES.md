IZ2S SB4 is a homebrew launcher for Nintendo Switch 2, designed for use with SmileBASIC 4. This edition includes the PC panel, console launcher, device setup and App Store.

## Included in this release

* Dedicated SmileBASIC 4 setup and launch workflow.
* Compact sidebar logo and language selector.
* IZ2S Cheese 0.8.7 in the App Store.
* BlitBun 1.15.8, Book Reader 0.1.0, Foldrift 0.3.3, VacooTube 1.5.7 and IZPSX 0.5.2.
* Separate installation folders and desktop shortcuts for IZ2S SB4.

## Downloads

| System | Download |
| --- | --- |
| Linux x64 / ARM64 | [Linux installation archive](https://github.com/byizmysh/IZ2S-SB4/releases/download/v0.25.2-sb4.1/IZ2S-SB4-0.25.2-linux.tar.gz) |
| Windows x64 | [Windows installation ZIP](https://github.com/byizmysh/IZ2S-SB4/releases/download/v0.25.2-sb4.1/IZ2S-SB4-0.25.2-windows-x64.zip) |
| Checksums | [SHA256SUMS.txt](https://github.com/byizmysh/IZ2S-SB4/releases/download/v0.25.2-sb4.1/SHA256SUMS.txt) |

Use the installation archive for your operating system. GitHub's automatic **Source code** archives are intended for development and do not contain the complete Linux runtime kits.

## Before installation

1. Download the appropriate archive from the table above or the Assets section below.
2. Extract the entire archive into a new folder. Preserve all files and subfolders. Do not run the installer from inside the ZIP or merge the extracted files with an existing installation.
3. Keep an internet connection available. Setup may need to download required PC dependencies.
4. Run the installer as described below. It creates a separate installation for your user account and prints its location. The extracted download folder and the installed folder are different locations.

If you already use IZ2S, keep your existing installation and personal data until you have confirmed that the new copy works. Setup uses a new versioned folder.

## Linux installation

Linux x64 and ARM64 are supported.

1. Open the extracted folder in your file manager, then open a terminal in that folder.
2. Run:

   ```sh
   sh ./install.sh --launch
   ```

3. Follow any package manager prompts. Your password may be requested when missing system dependencies need to be installed.
4. Wait for setup to finish. It checks the required tools, prepares Node.js if needed, verifies the packaged files, creates shortcuts and opens the panel.
5. Save the installation path printed by setup. By default, installations are placed under:

   ```text
   ~/.local/share/iz2s-sb4/releases/
   ```

For later launches, open the IZ2S SB4 shortcut from your application menu. You can also open a terminal in the **installed folder** and run:

```sh
./start.sh
```

You do not need to run the installer again each time you use the panel.

## Windows installation

Windows x64 is supported. Windows ARM64 and 32 bit Windows are not supported by this package.

1. Right click the downloaded ZIP and choose **Extract All**.
2. Open the extracted folder and double click `Install.cmd`.
3. Wait for setup to complete. It prepares private Node.js, Python and Pillow runtimes, adds an SSH client if needed, verifies the files and creates shortcuts. No manual Node.js or Python installation is required.
4. Wait until setup reports that installation has finished and opens the panel. Keep the installed folder at the location printed by setup. The default parent folder is:

   ```text
   %LOCALAPPDATA%\IZ2S SB4\releases\
   ```

5. If Windows asks for firewall permission for Node.js, allow access on your private network when you intend to connect a console.

For later launches, use the IZ2S SB4 desktop or Start menu shortcut. Alternatively, double click `Start.vbs` in the **installed folder** to open the panel without a console window. `Start.cmd` is available when you need to see diagnostic output.

## Open the panel and connect

The panel normally opens automatically at:

```text
http://127.0.0.1:39524
```

PC Link uses port `39525`. Keep the PC and input device reachable on the same local network.

1. Open SmileBASIC 4 on Nintendo Switch 2.
2. In the panel, select your input device and network adapters. Follow the device setup instructions shown for Switch 1, Cardputer ADV or ARM PC.
3. Use **First Setup** if the console has not been prepared yet. Follow the panel instructions through source entry and saving.
4. For subsequent sessions, use **Launch** and follow the prompts shown in the panel.
5. Open **App library** to select an application for the connected console or use the SD installation/export action.

BlitBun and VacooTube PC media services require Linux. Their application files remain included in the Windows package. BIOS files, games, Nintendo keys, personal settings and previous sessions are not supplied.

## If setup or startup fails

1. Confirm that you extracted the complete archive and selected the correct operating system package.
2. Keep the setup window open and read the reported error. Resolve the missing dependency or download issue before trying again.
3. On Windows, use `Start.cmd` in the installed folder to see startup diagnostics. Startup logs are stored under `data/state/startup.log` in that folder.
4. To repeat the packaged file check on Linux, run this from the installed folder:

   ```sh
   ./tools/node distribution/verify.cjs
   ```

5. On Windows, run this from PowerShell in the installed folder:

   ```powershell
   .\data\runtime\node\node.exe .\distribution\verify.cjs
   ```

Package integrity, App Store downloads and browser previews were checked on Linux. Native Windows installation and physical console operation have not been tested for this edition.

[Installation guide](README.md) | [Compatibility](COMPATIBILITY.md) | [Authors and licenses](AUTHORS.md) | [Source information](SOURCES.md)
