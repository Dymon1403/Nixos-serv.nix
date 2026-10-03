{ config, pkgs, ... }:

{
  # ============================================
  # Boot
  # ============================================

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # ============================================
  # Network
  # ============================================

  networking.hostName = "Serverdmitrj";

  networking.networkmanager.enable = true;

  # ============================================
  # Ssh
  # ============================================

  services.openssh.enable = true;

  # ============================================
  # Bash_Aliases
  # ============================================

  environment.shellAliases = {

            ls = "ls --color=auto";
            grep = "grep --color=auto";
            bt = "bluetoothctl";
            ff = "fastfetch";
            cm = "cmus";
            nn = "nvim ~/dot/configuration.nix";
            zap = "./zapret.sh";
           };

  # ============================================
  # Locale / Time
  # ============================================

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_TIME = "ru_RU.UTF-8";

  };

  # ============================================
  # Keyboard
  # ============================================

  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:caps_toggle,caps:shift_capslock";
  };

  # ============================================
  # User
  # ============================================

  users.users.server = {
    isNormalUser = true;

    extraGroups = [
      "wheel"

      "networkmanager"

      "video"

      "input"

      "docker"
  ];

    shell = pkgs.bash;
  };

  # ============================================
  # Firmware
  # ============================================

  hardware.enableRedistributableFirmware = true;

  # ============================================
  # Fonts_packages
  # ============================================

  fonts.packages = with pkgs; [
    material-design-icons
    font-awesome
    nerd-fonts.jetbrains-mono
  ];

  # ============================================
  # Fonts
  # ============================================

  fonts.fontconfig.enable = true;

  # ============================================
  # Nix
  # ============================================

  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # ============================================
  # NixOS version
  # ============================================

  system.stateVersion = "26.05";
}
