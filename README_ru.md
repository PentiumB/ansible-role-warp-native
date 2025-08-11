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

### Основные переменные

| Переменная | По умолчанию | Описание |
|------------|--------------|----------|
| `warp_native_state` | `present` | Состояние установки WARP (`present`/`absent`) |
| `warp_native_modify_resolv` | `false` | Изменять ли /etc/resolv.conf |
| `warp_native_temp_nameservers` | `["1.1.1.1", "8.8.8.8"]` | Временные DNS серверы во время настройки |

### Настройки wgcf

| Переменная | По умолчанию | Описание |
|------------|--------------|----------|
| `warp_native_wgcf_version` | `latest` | Версия wgcf для установки |
| `warp_native_wgcf_install_path` | `/usr/local/bin/wgcf` | Путь установки бинарного файла wgcf |

### Настройки WireGuard

| Переменная | По умолчанию | Описание |
|------------|--------------|----------|
| `warp_native_conf_dir` | `/etc/wireguard` | Директория конфигурации WireGuard |
| `warp_native_conf_name` | `warp.conf` | Имя файла конфигурации WireGuard |
| `warp_native_enable` | `true` | Включить службу WireGuard при загрузке |
| `warp_native_keepalive` | `25` | Интервал keepalive для WireGuard |
| `warp_native_table_off` | `true` | Отключить таблицу маршрутизации WireGuard |

### Настройки проверки

| Переменная | По умолчанию | Описание |
|------------|--------------|----------|
| `warp_native_check_retries` | `10` | Количество попыток проверки соединения |
| `warp_native_check_delay` | `1` | Задержка между попытками (секунды) |

### Настройки очистки

| Переменная | По умолчанию | Описание |
|------------|--------------|----------|
| `warp_native_purge_all` | `true` | Удалить все файлы WARP при деинсталляции |
| `warp_native_remove_wireguard_pkg` | `false` | Удалить пакет WireGuard при деинсталляции |
| `warp_native_cleanup_dns_backup` | `true` | Очистить файлы резервных копий DNS |

## Зависимости

Эта роль требует коллекцию `community.general`. Установите её командой:

```bash
ansible-galaxy collection install community.general
```

## Пример playbook

### Установка WARP (настройки по умолчанию)

```yaml
- hosts: servers
  become: yes
  roles:
    - role: melbine.warp_native
```

### Установка WARP с пользовательскими настройками

```yaml
- hosts: servers
  become: yes
  roles:
    - role: melbine.warp_native
      vars:
        warp_native_modify_resolv: true
        warp_native_keepalive: 30
        warp_native_conf_name: "custom-warp.conf"
```

### Удаление WARP

```yaml
- hosts: servers
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