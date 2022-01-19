# Install Arch

## Reference

- [Arch Installation guide](https://wiki.archlinux.org/title/Installation_guide)
- [Import any Linux distribution to use with WSL](https://docs.microsoft.com/en-us/windows/wsl/use-custom-distro)

## Intro

Install and config yay, vim, gnome with WhiteSur theme.

## How to use

### VMWare

```zsh
git clone https://github.com/lewwcom/arch-install
cd arch-install
bash arch-install.bash
```

### WSL

Integrate Docker with Ubuntu WSL. In Bash of Ubuntu WSL run:

```bash
docker run --name container_name archlinux
docker export container_name > /mnt/c/path/to/tar/arch.tar
```

Import arch.tar to wsl in PowerShell:

```powershell
wsl --import distro_name install_location c/path/to/tar/arch.tar
wsl -d distro_name
```

Finish installing Arch like VMWare.

