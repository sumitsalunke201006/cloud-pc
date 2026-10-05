# ☁️ Cloud PC — Windows 10 in Your Browser

Run a full Windows 10 desktop in a browser tab. Free, using GitHub Codespaces + Docker.
No installation on your own device. Built by **Sumit Salunke**.

## 🚀 Start in 3 steps

**1. Create the cloud PC (one click):**
👉 https://codespaces.new/sumitsalunke201006/cloud-pc

**2. Wait.** The codespace builds (~5 min), then Windows downloads and installs
itself (~10–20 min, it's a ~4 GB download). Watch it with:
```
docker logs -f cloudpc
```
When the logs stop moving and show the noVNC address, Windows is ready.

**3. Open the desktop.** In the Codespaces "PORTS" tab → find port **8006** →
right-click → **Port Visibility → Public** → click the globe 🌐 icon.
A Windows 10 desktop opens in your browser. That's your PC.

## 🛑 Save your free hours

GitHub gives **60 free Codespace hours/month**. A running Windows eats them fast.

- **Stop** the codespace when you're done (Codespaces panel → Stop). Your
  Windows disk is saved and resumes next start.
- **Delete** the codespace if you won't use it for a while.

## ⚙️ Details

- Image: `dockurr/windows` (Windows 10, 4 GB RAM, 2 CPU, 32 GB disk)
- Web desktop: port `8006` · RDP: port `3389`
- Restart Windows any time: `docker restart cloudpc`
- If it's slow: Codespaces usually lack KVM, so Windows runs in
  compatibility mode. Fine for browsing and light apps, not for gaming.

## ⚖️ Honest notes

- Windows is a Microsoft product — this downloads it from Microsoft's own
  servers. For long-term daily use you should hold a valid Windows license.
- No tricks here: no follow-gates, no locked features. It's yours.
