#cloud-config
users:
  - name: ubuntu
    groups: sudo
    shell: /bin/bash
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]

runcmd:
  - mkdir -p /home/ubuntu/.ssh
  - echo "${ssh_keys}" >> /home/ubuntu/.ssh/authorized_keys
  - chown -R ubuntu:ubuntu /home/ubuntu/.ssh
  - chmod 700 /home/ubuntu/.ssh
  - chmod 600 /home/ubuntu/.ssh/authorized_keys

package_update: true
package_upgrade: false
packages:
  - nginx