# Ansible Role: Cloudflare WARP Native

[![Ansible Galaxy](https://img.shields.io/badge/ansible--galaxy-melbine.warp__native-blue.svg)](https://galaxy.ansible.com/melbine/warp_native)
[![License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](LICENSE)

Ansible роль для установки и настройки Cloudflare WARP через wgcf и WireGuard. Настраивает сетевой интерфейс и проверяет handshake подключение. Поддерживает два состояния: `present` и `absent`.

**🇬🇧 [English version](README.md)**

## Требования

- Ansible >= 2.14
- Коллекции: `community.general`
- Целевые системы: Debian 11/12, Ubuntu 20.04/22.04/24.04

## Переменные роли

Все доступные переменные см. в `defaults/main.yml`.

### Основные переменные

| Переменная | По умолчанию | Описание |
|------------|--------------|----------|
| `warp_native_state` | `present` | Состояние установки WARP (`present`/`absent`) |
| `warp_native_interface` | `warp0` | Имя WireGuard интерфейса |
| `warp_native_config_path` | `/etc/wireguard` | Путь к конфигурации WireGuard |

## Зависимости

Эта роль требует коллекцию `community.general`. Установите её командой:

```bash
ansible-galaxy collection install community.general
```

## Пример playbook

```yaml
- hosts: servers
  become: yes
  roles:
    - role: melbine.warp_native
      vars:
        warp_native_state: present
        warp_native_interface: warp0
```

### Установка WARP

```yaml
- hosts: warp_servers
  become: yes
  roles:
    - role: melbine.warp_native
      vars:
        warp_native_state: present
```

### Удаление WARP

```yaml
- hosts: warp_servers
  become: yes
  roles:
    - role: melbine.warp_native
      vars:
        warp_native_state: absent
```

## Лицензия

MIT

## Информация об авторе

Эта роль была создана [Melbine](https://github.com/themelbine). 