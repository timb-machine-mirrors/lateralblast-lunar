# audit_mesgn
#
# The "mesg n" command blocks attempts to use the write or talk commands to
# contact users at their terminals, but has the side effect of slightly
# strengthening permissions on the user's tty device.
# Note: Setting mesg n for all users may cause "mesg: cannot change mode"
# to be displayed when using su - <user>.
# Since write and talk are no longer widely used at most sites, the incremental
# security increase is worth the loss of functionality.
#
# Refer to Section(s) 8.9 Page(s) 29 CIS FreeBSD Benchmark v1.0.5
#.

audit_mesgn () {
  if [ "$os_name" = "SunOS" ] || [ "$os_name" = "Linux" ] || [ "$os_name" = "FreeBSD" ]; then
    funct_verbose_message "Default mesg Settings for Users"
    for check_file in /etc/.login /etc/profile /etc/skel/.bash_profile /etc/skel/.bashrc \
      /etc/csh.login /etc/csh.cshrc /etc/zprofile /etc/skel/.zshrc /etc/skel/.bashrc; do
      funct_file_value $check_file mesg space n hash
    done
  fi
}
