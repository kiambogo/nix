# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos")
    ];

  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "christopher-x1"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Canada/Vancouver";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp0s20f3.useDHCP = true;

  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    xserver = {
      enable = true;
      dpi = 96;
      displayManager.sddm.enable = true;
      desktopManager = {
        plasma5.enable = true;
      };
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = with pkgs; [
          dmenu
          i3lock
          i3status
          i3blocks
        ];
      };
      synaptics = {
        enable = false;
	twoFingerScroll = true;
      };
      xautolock = {
        enable = true;
        time = 10; # mins
        locker = "${pkgs.xlockmore}/bin/xlock -mode space";
      };
      xkbOptions = "caps:escape";
    };
    openssh.enable = true;
    devmon.enable = true;
    autorandr = {
      enable = true;
    };
    tlp.enable = true;
    acpid.enable = true;
  };

services.xserver.displayManager.sessionCommands = ''
   ${pkgs.xorg.xrdb}/bin/xrdb -merge <<EOF
      Xft.dpi: 144
      Xcursor.theme: xcursor-breeze
      Xcursor.size: 0
      Xft.antialias: true
      Xft.hinting:   true
      Xft.rgba:      rgb
      Xft.autohint:  false
      Xft.hintstyle: hintslight
      Xft.lcdfilter: lcddefault

      !! Theme
      *background:                      #222D31
      *foreground:                      #d8d8d8
      *fading:                          8
      *fadeColor:                       black
      *cursorColor:                     #1ABB9B
      *pointerColorBackground:          #2B2C2B
      *pointerColorForeground:          #16A085

      !! black dark/light
      *color0:                          #222D31
      *color8:                          #585858
      !! red dark/light
      *color1:                          #ab4642
      *color9:                          #ab4642
      !! green dark/light
      *color2:                          #7E807E
      *color10:                         #8D8F8D
      !! yellow dark/light
      *color3:                          #f7ca88
      *color11:                         #f7ca88
      !! blue dark/light
      *color4:                          #7cafc2
      *color12:                         #7cafc2
      !! magenta dark/light
      *color5:                          #ba8baf
      *color13:                         #ba8baf
      !! cyan dark/light
      *color6:                          #1ABB9B
      *color14:                         #1ABB9B
      !! white dark/light
      *color7:                          #d8d8d8
      *color15:                         #f8f8f8
   EOF
'';

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.christopher = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "sudo" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    arandr
    wget
    vim
    firefox
    git
    zip
    unzip
    killall
    lsof
    whois
    dnsutils
    htop
    xsel
    bash
    openssl
    pavucontrol
    volumeicon
    dunst
    networkmanager
    kitty
    xorg.xmodmap
    emacs
    tmux
    spotify
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    nm-applet.enable = true;
  };

  fonts.fonts = with pkgs; [
    fira-code
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}

