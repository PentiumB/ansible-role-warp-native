#!/bin/bash

echo "Testing warp_native Ansible role..."

# Проверка синтаксиса
echo "1. Checking syntax..."
ansible-playbook test-playbook.yml --syntax-check

if [ $? -eq 0 ]; then
    echo "✓ Syntax check passed"
else
    echo "✗ Syntax check failed"
    exit 1
fi

# Dry run
echo "2. Running dry-run..."
ansible-playbook test-playbook.yml --check --diff

# Опционально: реальное выполнение (раскомментируйте при необходимости)
# echo "3. Running actual playbook..."
# ansible-playbook test-playbook.yml -v

echo "Testing completed!" 