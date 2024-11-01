{ ... }:

{
  networking = {
    hostName = "battlestation";
    networkmanager.enable = true;
    enableIPv6 = false;
    firewall.enable = false;

    extraHosts = ''
			192.168.49.2 retailer.local

			127.0.1.1 retailer-mongodb-0.retailer-mongodb-headless.default.svc.cluster.local dev1
			127.0.1.2 retailer-mongodb-1.retailer-mongodb-headless.default.svc.cluster.local dev2
			127.0.1.3 retailer-mongodb-2.retailer-mongodb-headless.default.svc.cluster.local dev3

			127.0.2.1 135.181.132.50 prod1
			127.0.2.2 135.181.132.48 prod2
			127.0.2.3 135.181.132.46 prod3
    '';
  };
}

# 127.0.1.1 development-mongodb-0.development-mongodb-headless.ci-apps.svc.cluster.local dev1
# 127.0.1.2 development-mongodb-1.development-mongodb-headless.ci-apps.svc.cluster.local dev2
# 127.0.1.3 development-mongodb-2.development-mongodb-headless.ci-apps.svc.cluster.local dev3
