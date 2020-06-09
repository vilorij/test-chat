docker_repo:
  pkgrepo.managed:
    - humanname: Docker
    - name: deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ grains['oscodename'] }} stable
    - dist: {{ grains['oscodename'] }}
    - file: /etc/apt/sources.list.d/docker.list
    - gpgcheck: 1
    - key_url: https://download.docker.com/linux/ubuntu/gpg

docker_deps:
  pkg.installed:
    - pkgs:
      - apt-transport-https
      - ca-certificates
      - curl
      - gnupg-agent
      - software-properties-common
      - python3-pip
  pip.installed:
    - name: docker
    - reload_modules: True
    - bin_env: /usr/bin/pip3
# Move to pip 3 is dirty hack for strange issue with python2 and pip v 10.+ incomoatability - see more at https://github.com/saltstack/salt/issues/46163. Reproduce from time to time.
# With pkg.installed: python-docker instead of pip.installed: docker get an error "Comment: State 'docker_container.running' was not found in SLS 'apps' Reason: 'docker_container' virtual returned False: 'docker.version' is not available."
# So, pls sorry for this tricky.

docker-ce:
  pkg.installed: []
  service.running:
    - name: docker
    - enable: True
    - require:
      - pkg: docker-ce
