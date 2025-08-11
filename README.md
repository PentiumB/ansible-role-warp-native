# ansible-role-warp-native

Устанавливает Cloudflare WARP через wgcf и WireGuard, настраивает интерфейс и проверяет handshake. Поддерживает два состояния: present и absent.

## Требования
- Ansible >= 2.14
- Коллекции: community.general
- Цели: Debian 11/12, Ubuntu 20.04/22.04/24.04

## Переменные
См. defaults/main.yml.

## Примеры
```yaml
- hosts: warp
  roles:
    - role: melbine.warp_native
      vars:
        warp_native_state: present
