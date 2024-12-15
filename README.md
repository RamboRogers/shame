<div align="center">
  <img src="shame.gif" alt="Shame Into Gif">
  <h1>SHAME</h1>
  <p>
    <strong>Lightning-fast, zero-configuration file sharing and management tool</strong>
  </p>
  <p>
    <strong>🪟 Windows • 🍎 Mac • 🐧 Linux</strong><br>
    <sub>Single Binary • Zero Dependencies • Instant Setup</sub>
  </p>
</div>

---

SHAME makes it effortless to upload, download, preview and manage files through your web browser. Whether you're sharing project files with teammates, hosting media content, or just need a quick way to transfer files between devices, SHAME provides a beautiful and intuitive solution that works right out of the box.

Perfect for developers, content creators, and anyone who needs hassle-free file sharing, SHAME combines the simplicity of a single binary with the power of modern web technologies. No complex setup, no dependencies, no accounts required - just run the binary and start sharing instantly.

## 🌟 What's New in v1.0.2s

- **🔐 Single-Use File Links**: Generate disposable links that automatically dissolve after use
- **🌐 Cloudflare Integration**: Secure HTTPS access with dynamic tunneling
- **🛡️ Read-Only Mode**: Added option to run server in read-only mode
- **🔒 Enhanced Security**: Improved access controls and file handling

## ⚡ Installation

The binary is available for Windows, Mac, and Linux. It's in the repo above. I've put together scripts to install it on each platform. You can review the scripts before running them above.

### 🪟 Windows Installation

Copy and paste into PowerShell:

```powershell
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/RamboRogers/shame/master/install_windows.ps1'))
```

### 🍎 Mac (Apple Silicon & Intel) and 🐧 Linux

Copy and paste into your terminal:

```bash
curl -L https://raw.githubusercontent.com/RamboRogers/shame/master/install.sh | sh
```

Now you can run `shame` from anywhere on your machine:

```bash
shame
```

## 🚀 Usage

SHAME offers flexible deployment options to suit your needs:

```bash
# Standard Usage
shame                    # Start server in normal mode (authenticated)
shame readonly           # Start server in read-only mode

# Cloudflare Tunnel Options
shame tunnel            # Start with Cloudflare tunnel for HTTPS
shame tunnel readonly   # Tunnel with read-only mode

# Local Network Options (Use with caution)
shame insecure          # Start server without authentication (UNSAFE)
shame insecure readonly # Start without auth in read-only mode (UNSAFE)

# Help & Version
shame help              # Show help message
shame version           # Show version information
```

### 🌐 Sharing Modes

<table>
<tr>
<td>

### Authenticated Mode
- Default secure mode
- Access control
- File operation logging
- Perfect for remote access

</td>
<td>

### Tunnel Mode
- Secure HTTPS access
- Cloudflare integration
- Public accessibility
- Single-use share links

</td>
<td>

### Read-Only Mode
- Secure file distribution
- Prevent modifications
- View-only access
- Available in all modes

</td>
</tr>
</table>

> ⚠️ **Security Notice**: The `insecure` flag disables authentication. Only use this option on trusted networks and when absolutely necessary.

Type `shame` in the folder you want to share from:

<div align="center">
  <img src="shame.png" alt="shame console" width="800">
  <p><i>The console will output the URL to the web interface.</i></p>
</div>

### 🖥️ Web Interface

<div align="center">
  <img src="shame-web.png" alt="shame web" width="800">
</div>

Browse folders and preview images with mouse hover and keyboard navigation. Press enter to download files.

<div align="center">
  <img src="shame-image.png" alt="shame image preview" width="800">
</div>

## ✨ Features

<table>
<tr>
<td>

### Core Features
- 🚀 Single Binary, Zero Dependencies
- 🌍 Cross-Platform Support
- ⚡ Instant Setup
- 🎨 Beautiful Dark Mode Interface
- 🔐 Single-Use Share Links

</td>
<td>

### File Operations
- 📂 Directory Browsing
- ⬆️ Drag & Drop Upload
- ⬇️ Fast Downloads
- 🗑️ File Management
- 🔗 Direct Link Sharing

</td>
<td>

### Security & Access
- 🛡️ Read-Only Mode
- 🌐 HTTPS via Cloudflare
- 🔒 Access Controls
- 📊 Progress Tracking
- 🎯 Visual Feedback

</td>
</tr>
</table>

## 💡 Use Cases

- **Local Development**: Share project files instantly with teammates
- **Media Sharing**: Quick image and file previews
- **File Transfer**: Move files between devices effortlessly
- **Temporary Hosting**: Set up quick file sharing servers

## ⚖️ License and Contact

<div align="center">
  <p>This project is provided as is. Use at your own risk.</p>

  ### Connect With Me 🤝

  [![GitHub](https://img.shields.io/badge/GitHub-RamboRogers-181717?style=for-the-badge&logo=github)](https://github.com/RamboRogers)
  [![Twitter](https://img.shields.io/badge/Twitter-@rogerscissp-1DA1F2?style=for-the-badge&logo=twitter)](https://x.com/rogerscissp)
  [![Website](https://img.shields.io/badge/Web-matthewrogers.org-00ADD8?style=for-the-badge&logo=google-chrome)](https://matthewrogers.org)

  <img src="ramborogers.png" alt="github" width="400">
</div>