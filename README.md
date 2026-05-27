# 🏮 window-rice

A Windows desktop rice with a Hakurei Reimu (Touhou) aesthetic — warm reds, shrine browns, and soft pastels across the entire system.

> **Theme:** Reimu Warm — a cozy Japanese shrine palette with deep reds, warm tans, and soft off-whites.

---

## 🖼️ Showcase

| | |
|---|---|
| ![Desktop](showcase/desktop.png) | ![Terminal](showcase/terminal.png) |
| ![VS Code](showcase/vs.png) | ![Spicetify](showcase/spicetify.png) |
| ![WinLauncher](showcase/winlauncher.png) | ![Browser](showcase/browser.png) |

---

## 📁 What's Included

| Folder | Contents |
|---|---|
| `yasb/` | Status bar config (`config.yaml`) and stylesheet (`styles.css`) |
| `vscode/` | VS Code assets — background (`background.png`), sticker (`sticker.png`), preview shots |
| `terminal/` | PowerShell profile, Fastfetch config, Oh My Posh themes, color schemes |
| `discord/` | Vencord theme: `reimuPastel.theme.css` |
| `spicetify/` | Spicetify theme (`text`) + marketplace extension settings |
| `cursor/` | Hakurei Reimu pixel cursor set with installer |
| `browser/` | Browser GIF asset |
| `wallpaper/` | `reimu.jpg` wallpaper |
| `showcase/` | Preview screenshots |

---

## ✅ Requirements

- [YASB](https://github.com/amnweb/yasb) — Windows status bar
- [Cava](https://github.com/nicknisi/cava-windows) — audio visualizer (for YASB cava widget)
- [WinLaunch](https://winlaunch.org/) — macOS-style app launcher
- [VS Code](https://code.visualstudio.com/) + [Doki Theme extension](https://marketplace.visualstudio.com/items?itemName=unthrottled.doki-theme)
- [JetBrains Mono Nerd Font](https://www.nerdfonts.com/font-downloads) — used in terminal and bar
- [Oh My Posh](https://ohmyposh.dev/) — PowerShell prompt styling
- [Fastfetch](https://github.com/fastfetch-cli/fastfetch) — system info fetcher
- [Vencord](https://vencord.dev/) — Discord client mod
- [Spicetify](https://spicetify.app/) — Spotify client mod
- [Windows Terminal](https://aka.ms/terminal)

---

## 🪟 YASB — Status Bar

YASB is the top status bar. It shows clock, media, taskbar, CPU/RAM/disk, weather, volume, and notifications — plus a live audio visualizer via the Cava widget.

### Install YASB

```powershell
winget install AmN.yasb
```

Or download from the [releases page](https://github.com/amnweb/yasb/releases).

### Apply Config

Copy the files from the `yasb/` folder to your YASB config directory:

```powershell
Copy-Item .\yasb\config.yaml $env:USERPROFILE\.config\yasb\config.yaml
Copy-Item .\yasb\styles.css  $env:USERPROFILE\.config\yasb\styles.css
```

Then restart YASB (right-click tray icon → Restart).

**Widgets included:** `home`, `quick_launch`, `clock` (id_ID locale), `media`, `cava`, `systray`, `taskbar`, `traffic`, `weather`, `cpu`, `memory`, `disk`, `volume`, `notifications`, `power_menu`.

> ⚠️ The clock uses `id_ID` locale (Indonesian). Change `locale: "id_ID"` in `config.yaml` to your own locale if needed (e.g. `en_US`).

---

## 🎵 Cava — Audio Visualizer

Cava is the animated audio bar that sits in the YASB status bar. It visualizes your system audio in real time.

### Install Cava

Download the Windows build from the [cava-windows releases](https://github.com/nicknisi/cava-windows/releases) and put the executable somewhere permanent (e.g. `C:\tools\cava.exe`).

### Configuration

Cava is configured directly inside `yasb/config.yaml` under the `cava` widget — no separate config file needed. Current settings:

```yaml
cava:
  bar_height: 10
  min_bar_height: 1
  bars_number: 28
  bar_width: 1
  bar_spacing: 2
  bar_type: "bars_mirrored"
  framerate: 60
  hide_empty: true
  gradient: 1
  gradient_color_1: '#ffffff'
  gradient_color_2: '#ffffff'
  gradient_color_3: '#ffffff'
```

> ⚠️ YASB needs to know where `cava.exe` lives. If the widget shows nothing, set the path in YASB's settings or ensure `cava` is on your system `PATH`.

---

## 🚀 WinLaunch — App Launcher

WinLaunch is a standalone macOS Launchpad-style app launcher — separate from YASB. It gives you a fullscreen overlay to organize and launch all your apps.

### Install

Download from [winlaunch.org](https://winlaunch.org/) and run the installer.

### Setup

1. Launch WinLaunch — it sits in the system tray
2. Press the configured hotkey (default: `F1` or swipe gesture) to open the launcher overlay
3. **Add apps:** drag and drop `.exe` shortcuts or use right-click → Add App
4. **Create folders:** drag one app onto another to group them
5. **Customize appearance:** right-click the overlay → Settings → adjust size, animation, background blur, and theme

> The `showcase/winlauncher.png` shows how mine looks. Arrange your apps however you like — there's no config file to copy for this one.

---

## 💻 VS Code

### Install Doki Theme

1. Open VS Code
2. Go to Extensions (`Ctrl+Shift+X`)
3. Search for **Doki Theme** by unthrottled and install it
4. Open Command Palette (`Ctrl+Shift+P`) → `Preferences: Color Theme` → select **Doki Theme: Rias Gremory**

### Font Setup

Install **JetBrains Mono Nerd Font Propo** from [nerdfonts.com](https://www.nerdfonts.com/font-downloads), then add to VS Code `settings.json`:

```json
"editor.fontFamily": "JetBrainsMono NFP, JetBrains Mono, monospace",
"editor.fontSize": 14,
"editor.fontLigatures": true
```

### Background & Sticker

The screenshots use a custom background image and sticker overlay. Install the [Background extension](https://marketplace.visualstudio.com/items?itemName=shalldie.background) by shalldie, then point it to the assets in this repo:

```json
"background.enabled": true,
"background.useDefault": false,
"background.customImages": ["file:///C:/path/to/window-rice/vscode/background.png"],
"background.style": {
  "opacity": 0.08
},
"background.useFront": true,
"background.customImagesFront": ["file:///C:/path/to/window-rice/vscode/sticker.png"],
"background.styleFront": {
  "background-size": "200px",
  "background-position": "bottom 20px right 20px",
  "background-repeat": "no-repeat",
  "opacity": 0.8
}
```

> Replace `C:/path/to/window-rice` with the actual path to where you cloned this repo.

---

## 🖥️ Terminal Setup

The terminal uses **Windows Terminal** with a custom PowerShell profile powered by:

- **Fastfetch** — system info on shell startup
- **Oh My Posh** — custom `reimu_warm` prompt theme
- **Zoxide** — smarter `cd`
- **Eza** — modern `ls` with icons
- **Bat** — syntax-highlighted `cat`

### 1. Install Dependencies

```powershell
winget install JanDeDobbeleer.OhMyPosh
winget install ajeetdsouza.zoxide
winget install eza-community.eza
winget install sharkdp.bat
winget install fastfetch-cli.fastfetch
```

### 2. Install JetBrains Mono Nerd Font

Download **JetBrainsMono NFP** from [nerdfonts.com](https://www.nerdfonts.com/font-downloads), install it, then set it as your Windows Terminal font in `settings.json`:

```json
"font": {
  "face": "JetBrainsMono NFP",
  "size": 12
}
```

### 3. Apply Color Scheme

Open Windows Terminal Settings → Open JSON file and paste the contents of `terminal/color scheme.txt` into the `"schemes"` array. Included schemes:

| Name | Vibe |
|---|---|
| **Hakurei Autumn** | Warm dark browns, muted reds |
| **Hakurei Reimu** | Deep purple-blue, red & gold |
| **Reimu Hakurei** | Dark violet, crimson red |
| **Reimu Warm Autumn** | Rich warm browns, off-white text |
| **Rosé Pine** | Muted rose, lavender |
| **Soft Pink Rice** | Catppuccin-based soft pinks |

Then set your preferred scheme on your PowerShell profile:

```json
"colorScheme": "Reimu Warm Autumn"
```

### 4. Apply PowerShell Profile & Fastfetch

```powershell
# Copy Oh My Posh themes
Copy-Item .\terminal\omposh_themes\ $env:USERPROFILE\omposh_themes\ -Recurse

# Copy Fastfetch config
Copy-Item .\terminal\fastfetch\ $env:USERPROFILE\.config\fastfetch\ -Recurse

# Copy startup profile — edit paths inside before applying!
Copy-Item .\terminal\startup.ps1 $PROFILE
```

> ⚠️ **Edit `startup.ps1` before copying!** It has hardcoded paths — update these two lines to match where you installed things:

```powershell
& "D:\codingan\fastfetch.exe"                        # → your fastfetch.exe path
$env:POSH_THEMES_PATH = "D:\codingan\omposh_themes\" # → your themes folder path
```

Also fix the Reimu logo path in `terminal/fastfetch/config.jsonc`:

```json
"source": "C:/Users/Sakuntala/.config/fastfetch/reimu.txt"
// Change "Sakuntala" to your actual Windows username
```

### 5. Reload

```powershell
. $PROFILE
```

---

## 🖱️ Cursor

A custom Hakurei Reimu pixel cursor set is included in `cursor/Hakurei Reimus Pixel Cursors ani/`.

### Install

1. Open the `cursor/Hakurei Reimus Pixel Cursors ani/` folder
2. Right-click `install.inf` → **Install**
3. Go to Windows Settings → Bluetooth & devices → Mouse → Additional mouse settings → **Pointers** tab
4. Under **Scheme**, select **Hakurei Reimus Pixel Cursors** from the dropdown
5. Click **Apply**

---

## 🎮 Discord — Vencord

### Install Vencord

Follow the [Vencord install guide](https://vencord.dev/install/).

### Apply Theme

1. In Discord, go to **User Settings → Vencord → Themes**
2. Click **Local Themes** and open the folder
3. Copy `discord/reimuPastel.theme.css` into that folder
4. Back in Vencord settings, enable **ReimuWarmPlus**

The theme applies a warm shrine-brown palette with JetBrains Mono font across Discord's UI, built on top of [DiscordPlus](https://github.com/plusinsta/discord-plus).

---

## 🎵 Spicetify — Spotify

### Install Spicetify

```powershell
iwr -useb https://raw.githubusercontent.com/spicetify/cli/main/install.ps1 | iex
```

Then install Spicetify Marketplace:

```powershell
iwr -useb https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.ps1 | iex
```

### Apply Theme

```powershell
$themePath = "$env:USERPROFILE\AppData\Local\spicetify\Themes\text"
New-Item -ItemType Directory -Force -Path $themePath
Copy-Item .\spicetify\text\color.ini $themePath\color.ini
Copy-Item .\spicetify\text\user.css  $themePath\user.css

spicetify config current_theme text color_scheme Spicetify
spicetify apply
```

### Marketplace Extensions

Go to **Marketplace → Settings → Import** and load `spicetify/marketplace-settings-2026-05-26T15_06_26.763Z.json`.

Installed extensions:
- **adblockify** — blocks Spotify ads
- **Custom Controls** — replaces the titlebar
- **No Controls** — removes the titlebar (toggle with `F8`)
- **Full Screen** — fancy album art fullscreen view

---

## 🖼️ Wallpaper

Right-click `wallpaper/reimu.jpg` → **Set as desktop background**, or set it via Windows Settings → Personalization → Background.

---

## 🗂️ Quick Checklist

- [ ] YASB installed and config/styles copied to `~/.config/yasb/`
- [ ] Cava installed and on PATH (or path configured in YASB)
- [ ] WinLaunch installed and apps organized
- [ ] JetBrains Mono Nerd Font installed
- [ ] VS Code Doki Theme installed, color theme set to **Rias Gremory**
- [ ] VS Code Background extension configured with `vscode/background.png` and `vscode/sticker.png`
- [ ] Windows Terminal color scheme added and selected
- [ ] `startup.ps1` paths updated and copied to `$PROFILE`
- [ ] Fastfetch config path updated with your username
- [ ] Oh My Posh themes copied to your themes folder
- [ ] Cursor scheme installed via `install.inf`
- [ ] Vencord installed and `reimuPastel.theme.css` added
- [ ] Spicetify `text` theme applied and marketplace extensions imported
- [ ] Wallpaper set

---

<div align="center">
  <sub>✨ gensokyo on windows ✨</sub>
</div>
