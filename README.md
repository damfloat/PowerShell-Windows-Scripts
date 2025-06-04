# PowerShell-Windows-Scripts

A small collection of PowerShell scripts for Windows 11.

## Repository Structure (English)

- `PowerShell Windows Scripts/` – contains all scripts.
  - `GUI/` – scripts that modify the user interface.
  - `Network/` – scripts for network settings.

### GUI Scripts

- `toggle_context_menu.ps1` – toggles between the classic Windows 10 style context menu and the default Windows 11 context menu.

### Network Scripts

- `cf_dns.ps1` – sets DNS servers for all adapters to Cloudflare (1.1.1.1) and Google (8.8.8.8).
- `list_open_ports.ps1` – lists open TCP/UDP ports with status, PID and owning process name.
- `reset_network.ps1` – resets DNS cache, TCP/IP stack, Winsock and restarts network adapters.

---

## Структура репозитория (на русском)

- `PowerShell Windows Scripts/` – папка со скриптами.
  - `GUI/` – скрипты для изменения интерфейса.
  - `Network/` – скрипты для работы с сетью.

### Скрипты GUI

- `toggle_context_menu.ps1` – включает классическое контекстное меню как в Windows 10 или возвращает стандартное меню Windows 11.

### Сетевые скрипты

- `cf_dns.ps1` – задаёт DNS 1.1.1.1 и 8.8.8.8 для всех сетевых адаптеров.
- `list_open_ports.ps1` – показывает открытые TCP и UDP порты, состояние, PID и название процесса.
- `reset_network.ps1` – сбрасывает DNS-кеш, стек TCP/IP, Winsock и перезапускает сетевые адаптеры.
