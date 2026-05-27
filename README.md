# 🏮 window-rice

A Windows desktop rice with a Hakurei Reimu (Touhou) aesthetic — warm reds, shrine browns, and soft pastels across the entire system.

> **Theme:** Reimu Warm — a cozy Japanese shrine palette with deep reds, warm tans, and soft off-whites.

---

## 📁 What's Included

| Folder | Contents |
|---|---|
| `yasb/` | Status bar config (`config.yaml`) and stylesheet (`styles.css`) |
| `vscode/` | VS Code preview screenshots |
| `terminal/` | PowerShell profile, Fastfetch config, Oh My Posh themes, color schemes |
| `discord/` | Vencord theme: `reimuPastel.theme.css` |
| `spicetify/` | Spicetify theme (`text`) + marketplace extension settings |
| `browser/` | Browser GIF asset |
| `wallpaper/` | `reimu.jpg` wallpaper |

---

## ✅ Requirements

Before starting, make sure you have these installed:

- [YASB](https://github.com/amnweb/yasb) — Windows status bar
- [VS Code](https://code.visualstudio.com/) + [Doki Theme extension](https://marketplace.visualstudio.com/items?itemName=unthrottled.doki-theme)
- [JetBrains Mono Nerd Font](https://www.nerdfonts.com/font-downloads) — used in terminal and bar
- [Oh My Posh](https://ohmyposh.dev/) — PowerShell prompt styling
- [Fastfetch](https://github.com/fastfetch-cli/fastfetch) — system info fetcher
- [Vencord](https://vencord.dev/) — Discord client mod
- [Spicetify](https://spicetify.app/) — Spotify client mod
- [Windows Terminal](https://aka.ms/terminal)

---

## 🪟 YASB — Status Bar

YASB is the top status bar. It shows clock, media, taskbar, CPU/RAM/disk, weather, volume, and notifications.

### Install YASB

```powershell
winget install AmN.yasb
```

Or download from the [releases page](https://github.com/amnweb/yasb/releases).

### Apply Config

Copy the files from the `yasb/` folder to your YASB config directory:

```
%USERPROFILE%\.config\yasb\
```

```powershell
# Example
Copy-Item .\yasb\config.yaml $env:USERPROFILE\.config\yasb\config.yaml
Copy-Item .\yasb\styles.css  $env:USERPROFILE\.config\yasb\styles.css
```

Then restart YASB (right-click tray icon → Restart).

**Widgets included:** `home`, `quick_launch`, `clock` (id_ID locale), `media`, `cava`, `systray`, `taskbar`, `traffic`, `weather`, `cpu`, `memory`, `disk`, `volume`, `notifications`, `power_menu`.

> ⚠️ The clock uses `id_ID` locale (Indonesian). Change `locale: "id_ID"` in `config.yaml` to your own locale if needed (e.g. `en_US`).

---

## 💻 VS Code

### Install Doki Theme

1. Open VS Code
2. Go to Extensions (`Ctrl+Shift+X`)
3. Search for **Doki Theme** by unthrottled
4. Install and activate it
5. Open Command Palette (`Ctrl+Shift+P`) → `Preferences: Color Theme` → select **Doki Theme: Reimu** (or your preferred Doki variant)

### Font Setup

Install **JetBrains Mono Nerd Font Propo** from [nerdfonts.com](https://www.nerdfonts.com/font-downloads), then set it in VS Code settings:

```json
"editor.fontFamily": "JetBrainsMono NFP, JetBrains Mono, monospace",
"editor.fontSize": 14,
"editor.fontLigatures": true
```

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
# Oh My Posh
winget install JanDeDobbeleer.OhMyPosh

# Zoxide
winget install ajeetdsouza.zoxide

# Eza
winget install eza-community.eza

# Bat
winget install sharkdp.bat

# Fastfetch
winget install fastfetch-cli.fastfetch
```

### 2. Install JetBrains Mono Nerd Font

Download **JetBrainsMono NFP** from [nerdfonts.com](https://www.nerdfonts.com/font-downloads), install it, then set it as your Windows Terminal font:

```json
// Windows Terminal settings.json → profiles → defaults
"font": {
  "face": "JetBrainsMono NFP",
  "size": 12
}
```

### 3. Apply Color Scheme

Open Windows Terminal Settings → Open JSON file and paste the color schemes from `terminal/color scheme.txt` into the `"schemes"` array. Included schemes:

| Name | Vibe |
|---|---|
| **Hakurei Autumn** | Warm dark browns, muted reds |
| **Hakurei Reimu** | Deep purple-blue, red & gold |
| **Reimu Hakurei** | Dark violet, crimson red |
| **Reimu Warm Autumn** | Rich warm browns, off-white text |
| **Rosé Pine** | Muted rose, lavender |
| **Soft Pink Rice** | Catppuccin-based soft pinks |

Set your preferred scheme under your PowerShell profile:

```json
"colorScheme": "Reimu Warm Autumn"
```

### 4. Apply PowerShell Profile & Fastfetch

Copy the Oh My Posh themes folder and fastfetch config, then update the paths in `startup.ps1` to match your setup.

```powershell
# Copy Oh My Posh themes
Copy-Item .\terminal\omposh_themes\ $env:USERPROFILE\omposh_themes\ -Recurse

# Copy Fastfetch config
Copy-Item .\terminal\fastfetch\ $env:USERPROFILE\.config\fastfetch\ -Recurse

# Copy startup profile — edit paths inside before applying!
Copy-Item .\terminal\startup.ps1 $PROFILE
```

> ⚠️ **Edit `startup.ps1` first!** It has hardcoded paths like `D:\codingan\fastfetch.exe` — update these to wherever you installed your tools.

Key lines to update in `startup.ps1`:

```powershell
# Change these to your actual paths:
& "D:\codingan\fastfetch.exe"              # → path to fastfetch.exe
$env:POSH_THEMES_PATH = "D:\codingan\omposh_themes\"  # → path to themes folder
```

Also update the Fastfetch config at `terminal/fastfetch/config.jsonc` — the logo source path:

```json
"source": "C:/Users/Sakuntala/.config/fastfetch/reimu.txt"
// Change "Sakuntala" to your actual Windows username
```

### 5. Reload

```powershell
. $PROFILE
```

---

## 🎮 Discord — Vencord

### Install Vencord

Follow the [Vencord install guide](https://vencord.dev/install/).

### Apply Theme

1. In Discord, go to **User Settings → Vencord → Themes**
2. Click **Local Themes** and open the folder
3. Copy `discord/reimuPastel.theme.css` into that folder
4. Back in Vencord settings, enable **ReimuWarmPlus**

The theme applies a warm shrine-brown palette with JetBrains Mono font across Discord's UI. It's built on top of [DiscordPlus](https://github.com/plusinsta/discord-plus).

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

The theme used is `text` — a clean, minimal Spicetify theme.

```powershell
# Copy theme files
$themePath = "$env:USERPROFILE\AppData\Local\spicetify\Themes\text"
New-Item -ItemType Directory -Force -Path $themePath
Copy-Item .\spicetify\text\color.ini $themePath\color.ini
Copy-Item .\spicetify\text\user.css  $themePath\user.css

# Apply
spicetify config current_theme text color_scheme Spicetify
spicetify apply
```

### Marketplace Extensions

Import the marketplace settings by going to **Marketplace → Settings → Import** and loading `spicetify/marketplace-settings-2026-05-26T15_06_26.763Z.json`.

Installed extensions:
- **adblockify** — blocks Spotify ads
- **Custom Controls** — replaces the titlebar
- **No Controls** — removes the titlebar (toggle with `F8`)
- **Full Screen** — fancy album art fullscreen view

---

## 🖼️ Wallpaper

Set `wallpaper/reimu.jpg` as your desktop wallpaper. Right-click the file → **Set as desktop background**, or use Windows Settings → Personalization → Background.

---

## 🗂️ Quick Checklist

- [ ] YASB installed and config/styles copied to `~/.config/yasb/`
- [ ] JetBrains Mono Nerd Font installed
- [ ] VS Code Doki Theme installed and activated
- [ ] Windows Terminal color scheme added and selected
- [ ] `startup.ps1` paths updated and copied to `$PROFILE`
- [ ] Fastfetch config path updated with your username
- [ ] Oh My Posh themes copied to your themes folder
- [ ] Vencord installed and `reimuPastel.theme.css` added
- [ ] Spicetify installed and `text` theme applied
- [ ] Marketplace extensions imported
- [ ] Wallpaper set

---

<div align="center">
  <sub>✨ gensokyo on windows ✨</sub>
</div>
