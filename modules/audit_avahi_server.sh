# audit_avahi_server
#
# Avahi is a free zeroconf implementation, including a system for multicast
# DNS/DNS-SD service discovery. Avahi allows programs to publish and discover
# services and hosts running on a local network with no specific configuration.
# For example, a user can plug a computer into a network and Avahi
# automatically finds printers to print to, files to look at and people to
# talk to, as well as network services running on the machine.
#
# Refer to Section 3.3 Page(s) 60 CIS CentOS Linux 6 Benchmark v1.0.0
#.

audit_avahi_server () {
  if [ "$os_name" = "Linux" ]; then
    funct_verbose_message "Avahi Server"
    for service_name in avahi avahi-autoipd avahi-daemon avahi-dnsconfd; do
      funct_chkconfig_service $service_name 3 off
      funct_chkconfig_service $service_name 5 off
    done
  fi
}