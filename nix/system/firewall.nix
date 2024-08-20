{
  networking.firewall.extraCommands = ''
    iptables -N DOCKER-USER || true
    iptables -F DOCKER-USER
    iptables -A DOCKER-USER -i <external_iface> -m state --state RELATED,ESTABLISHED -j ACCEPT
    iptables -A DOCKER-USER -i <external_iface> -j DROP
  '';
}

