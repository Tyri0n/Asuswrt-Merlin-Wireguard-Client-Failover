# Asuswrt-Merlin-Wireguard-Client-Failover

## Script to perform failover for Wireguard VPN clients. This script attempts to make sure the Wireguard VPN client is always connected to a server by performing various periodic connectivity tests.

This script builds upon ```https://github.com/MerryMens/AsusMerlin-WireGuard-Failover```, adding more connectivity checks, options, etc.

Basic usage:

    Run '/jffs/scripts/wgc-failover 1', replacing '1' with your intended Wireguard client number

    Running '/jffs/scripts/wgc-failover --help' will display the optional arguments


How to setup:

    Copy wgc-failover to your router's /jffs/scripts folder

    Copy the contents of example-failover-configs to your '/jffs/configs' folder and rename/edit as required.

    By default the script looks here for the failover config:
    
        '/jffs/configs/wgc-failover-client-*CLIENT NUMBER*-conf'
    
    And here for the intended Wireguard client configs files listed in the corresponding failover config:

         '/jffs/configs/wgc-failover-client-*CLIENT NUMBER*-configs'

    Both of these default paths can be overridden on the command line.
    Also, the Wireguard config file's full paths can be specified in the failover config.

    Most command line arguments can be passed in the failover config to change settings
    for different Wireguard configs.


To start after a reboot:

    You need to run from this script from within '/jffs/scripts/services-start'.

    See 'example-services-start-append' for an example.
    
    Make sure to run as a background process by ending the command line with '&'


Usage: wgc-failover [Client Number <1 to 5>] [Options...]

    -h, --help     Show these instructions

    -k <0/1>       Enable killswitch                 (default: 1)
    -w <Seconds>   Wait between handshake checks     (default: 180)
    -t <Seconds>   Handshake timeout                 (default: 300)
    -q <0/1>       Quit on interface not found       (default: 0)
    -p <0/1>       Test ping                         (default: 1)
    -d <0/1>       Test DNS                          (default: 1)
    -c <0/1>       Test curl                         (default: 1)
    -n <Amount>    Log every Nth handshake           (default: 10)
    -a <Seconds>   Wait between WAN checks when down (default: 30)

    -pt <"IP,...">   Comma-separated list of IP addresses for ping test in quotes
                        (default: "8.8.8.8,1.1.1.1,9.9.9.9")
    -dt <"URL,...">  Comma-separated list of URLS for DNS test in quotes
                        (default: "google.com,amazon.com,cloudflare.com,facebook.com")
    -ct <"URL,...">  Comma-separated list of URLs for curl test in quotes
                        (default: "google.com,amazon.com,cloudflare.com,facebook.com")

    --reset        Resets any of the previous args shown above to
                    their default values (also shown above)

    --logslackpath   Path to shell script to pass priority logs to

    [Options...] can also be specified per client config in failover config files (on previous line)

    Command line only:

    --failoverconfigpath   Override the default path to the failover config
                            (from /jffs/configs/wgc-failover-[Client Number].conf)

    --clientconfigdir      Override the default configs directory path
                            (from /jffs/configs/wgc-failover-client-[Client Number]-configs)

    --disablewan1check     Don't check secondary WAN interface




