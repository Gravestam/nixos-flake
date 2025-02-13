{ pkgs, ... }:

{
  home.packages = with pkgs; [
		wpscan # wordpress pen testing
		nikto # webserver vuln testing
		zap # mitm (like burp)
		nuclei
    burpsuite
    aircrack-ng
    hcxtools # hcxpsktool hcxwltool whoismac wlancap2wpasec hcxpmktool hcxpcapngtool hcxhash2cap hcxhashtool hcxeiutool
    outils # md5
    hashcat # hashcat
    # john # john the ripper
    # wifite2 # wifite
		# airgeddon
    # bully
    qFlipper
	];
}
