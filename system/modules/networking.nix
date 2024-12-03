{ ... }:

{
  networking = {
    hostName = "battlestation";
    networkmanager.enable = true;
    enableIPv6 = false;
    firewall.enable = false;

    extraHosts = ''
			192.168.49.2 retailer.local

			127.0.1.1 mongodb-primary
			127.0.1.2 mongodb-secondary-1
			127.0.1.3 mongodb-secondary-2

			127.0.2.1 135.181.132.50 prod1
			127.0.2.2 135.181.132.48 prod2
			127.0.2.3 135.181.132.46 prod3
    '';
  };
}
