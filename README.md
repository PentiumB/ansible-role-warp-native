# Ansible Role: Cloudflare WARP Native

[![Ansible Galaxy](https://img.shields.io/badge/ansible--galaxy-melbine.warp__native-blue.svg)](https://galaxy.ansible.com/melbine/warp_native)
[![License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](LICENSE)

An Ansible role that installs and configures Cloudflare WARP using wgcf and WireGuard. It sets up the network interface and verifies handshake connectivity. Supports two states: `present` and `absent`.

**🇷🇺 [Русская версия документации](README_ru.md)**

## Requirements

- Ansible >= 2.14
- Collections: `community.general`
- Target systems: Debian 11/12, Ubuntu 20.04/22.04/24.04

## Role Variables

See `defaults/main.yml` for all available variables.

### Main Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `warp_native_state` | `present` | State of WARP installation (`present`/`absent`) |
| `warp_native_interface` | `warp0` | WireGuard interface name |
| `warp_native_config_path` | `/etc/wireguard` | Path to WireGuard configuration |

## Dependencies

This role requires the `community.general` collection. Install it with:

```bash
ansible-galaxy collection install community.general
```

## Example Playbook

```yaml
- hosts: servers
  become: yes
  roles:
    - role: melbine.warp_native
      vars:
        warp_native_state: present
        warp_native_interface: warp0
```

### Install WARP

```yaml
- hosts: warp_servers
  become: yes
  roles:
    - role: melbine.warp_native
      vars:
        warp_native_state: present
```

### Remove WARP

```yaml
- hosts: warp_servers
  become: yes
  roles:
    - role: melbine.warp_native
      vars:
        warp_native_state: absent
```

## License

MIT

## Author Information

This role was created by [Melbine](https://github.com/themelbine).
