defmodule Archcomposer do
  @moduledoc """
  Documentation for `Archcomposer`.

  """

  @doc """
  get_config
  Extracts the config from the config file.
  """
  def get_config(config) do
    config
  end

  @doc """
  get_disk_information
  """
  def get_disk_information(config) do
    config
  end
  @doc """
  get_user_settings
  """
  def get_user_settings(config) do
    config
  end
  @doc """
  setup_disks
  """
  def setup_disks(config) do
    config
  end

  @doc """
  prepare_disks
  """
  def prepare_disks(config) do
    config
    |> get_disk_information                    # Gets Disk's Information for partitioning
    |> get_user_settings                       # Prompts the user asking for his the password and then asks for Root's password.
    |> setup_disks                             # Sets up disks accordingly with the user settings
  end

  @doc """
  bootstrap_system
  Does the pacstrap with base.
  """
  def bootstrap_system(config) do
    config
  end


  @doc """
  set_local_time
  """
  def set_local_time(config) do
    config
  end

  @doc """
  setup_time
  """
  def setup_time(config) do
    config
  end

  @doc """
  add_locales
  """
  def add_locales(config) do
    config
  end

  @doc """
  set_default_locale
  """
  def set_default_locale(config) do
    config
  end

  @doc """
  generate_locales
  """
  def generate_locales(config) do
    config
  end

  @doc """
  configure_keyboard_layout
  """
  def configure_keyboard_layout(config) do
    config
  end

  @doc """
  setup_localization
  """
  def setup_localization(config) do
    config
    |> set_local_time                          # Sets localtime for the new system.
    |> setup_time                              # Sets up the time
    |> add_locales                             # Sets locales for the new system.
    |> set_default_locale                      # Sets the default locale.
    |> generate_locales                        # Generates all the selected locales
    |> configure_keyboard_layout               # Sets up keyboard layout for both terminal, terminal emulators and Desktop Environments
  end

  @doc """
  setup_users
  Gets the user list and make all the users accordingly with the config
  """
  def setup_users(config) do
    config
  end

  @doc """
  set_host_name
  """
  def set_host_name(config) do
    config
  end

  @doc """
  set_hosts
  """
  def set_hosts(config) do
    config
  end

  @doc """
  setup_networking
  """
  def setup_networking(config) do
    config
    |> set_host_name                           # Sets up the hostname
    |> set_hosts                               # Sets up the hosts file
  end

  @doc """
  add_mirrors
  """
  def add_mirrors(config) do
    config
  end

  @doc """
  add_repos
  """
  def add_repos(config) do
    config
  end

  @doc """
  setup_pacman_key
  """
  def setup_pacman_key(config) do
    config
  end

  @doc """
  trust_repo_keys
  """
  def trust_repo_keys(config) do
    config
  end

  @doc """
  update_after_pacstrap
  """
  def update_after_pacstrap(config) do
    config
  end

  @doc """
  setup_pacman
  """
  def setup_pacman(config) do
    config
    |> add_mirrors                             # Sets up pacman's official mirrors
    |> add_repos                               # Sets up custom repositories
    |> setup_pacman_key                        # Sets up pacman-key
    |> trust_repo_keys                         # Trusts custom repositories' keys
    |> update_after_pacstrap                   # Runs Pacman -Syu for updating the databases and getting eventual updates
  end

  @doc """
  install_pacman_packages
  """
  def install_pacman_packages(config) do
    config
  end

  @doc """
  install_aur_packages
  """
  def install_aur_packages(config) do
    config
  end

  @doc """
  install_packages
  """
  def install_packages(config) do
    config
    |> install_pacman_packages                 # Install all pacman packages listed in the config
    |> install_aur_packages                    # Install all aur packages listed in the config
  end

  @doc """
  setup_theming
  """
  def setup_theming(config) do
    config
  end

  @doc """
  edit_config_files
  Settings (Edit some configuration files) (can include disable password asking for wheels (sudo) for example)
  """
  def edit_config_files(config) do
    config
  end

  @doc """
  enable_services
  Enables the services listed in the config file
  """
  def enable_services(config) do
    config
  end

  @doc """
  create_initial_ramdisk
  runs mkinitcpio for all installed kernels
  """
  def create_initial_ramdisk(config) do
    config
  end

  @doc """
  install_bootloader
  Install bootloader
  """
  def install_bootloader(config) do
    config
  end

  @doc """
  create_bootloader_entries
  Creates bootloader entries
  """
  def create_bootloader_entries(config) do
    config
  end

  @doc """
  clear_pacman_cache
  Clears Pacman's Cache
  """
  def clear_pacman_cache(config) do
    config
  end

  @doc """
  reboot
  Duh
  """
  def reboot(config) do
    config
  end


  def main(args) do
    options = [switches: [file: :string], aliases: [f: :file]]
    {opts, _, _} = OptionParser.parse(args, options)
    IO.inspect(opts, label: "Command Line Arguments")

    opts[:file]
    |> Code.require_file
    |> get_config
    |> prepare_disks
    |> bootstrap_system
    |> setup_localization
    |> setup_users
    |> setup_networking
    |> setup_pacman
    |> setup_theming
    |> edit_config_files
    |> enable_services
    |> create_initial_ramdisk
    |> install_bootloader
    |> create_bootloader_entries
    |> clear_pacman_cache
    |> reboot
  end
end
