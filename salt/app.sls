webchat_docker:
  docker_container.running:
    - image: vilorij/erlang-chat:latest
    - port_bindings:
      - 31337:8080
    - environment:
      - BACKEND: {{ grains['fqdn_ip4'][0] }}
