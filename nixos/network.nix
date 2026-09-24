{ config, lib, pkgs, ... }:

{
	# Wireless Networking
	networking.hostName = "insnhstnix";
	networking.networkmanager.enable = true;
	networking.networkmanager.ensureProfiles.profiles = {
	    homeWifi = {
	     	connection = {
	        	id = "home-wifi";
	        	type = "wifi";
	        	autoconnect = true;     # try to connect automatically
	        	permissions = "";       # empty means "available to all users"
	      	};
	
	      	# how IPv4/IPv6 should be handled
	      	ipv4 = {
	        	method = "auto";
	      	};
	      	ipv6 = {
	        	method = "auto";
	        	addr-gen-mode = "stable-privacy";
	      	};
	
	      	# wifi settings
	      	wifi = {
	        	ssid = "RandomSSID0";
	        	mode = "infrastructure";
	      	};
	
	      	# wifi password settings
	      	wifi-security = {
	        	"key-mgmt" = "wpa-psk";
	        	psk = "AKA-BAKApar1eTheka";
	      	};
	    };
	 };

	services.tailscale.enable = false;  
}
