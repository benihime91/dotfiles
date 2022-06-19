# Dotfiles
My Config Files for starship, qtile, rofi, fish, etc. In the ```Arch-Setup-Scripts``` directory, I have three bash scripts in this repo, two of those
are for installing this setup and for a base Arch-Linux Install respectively. The other one is for setting up this rice on Ubuntu, which you can find
in the `ubuntu` branch.

To use the config on Arch, you will need to make 2 changes (If you are not using one of the setup scripts):
- Edit line `202` in the [dunstrc](https://github.com/Ruturajn/Dotfiles/blob/main/dunst/dunstrc) to add the path to dunst icons, which should be
  `~/.config/dunst/icons`, or if you have not moved the `dunst` folder to your `~/.config` directory `<Path_to_these_dotfiles>/dunst/icons`.
- Edit line `6` in the [autostart.sh](https://github.com/Ruturajn/Dotfiles/blob/main/qtile/autostart.sh) script to add the path to your wallpaper. 
  This can be skipped if you want to use nitrogen, to set your wallaper. To do that, you will need to set a wallpaper the first time you login to Qtile
  with `nitrogen`. This is only a one time thing, and the wallpaper you chose will persist, due to line `9` in the 
  [autostart.sh](https://github.com/Ruturajn/Dotfiles/blob/main/qtile/autostart.sh) script. Also, you will need to make the autostart script executable,
  with `chmod +x <Path-to-autostart.sh>/autostart.sh`.

*Note:* 
- *The Setup Install Script places the config files in their respective directories and installs the dependencies. Please read the ```README.md``` file placed
under the `Arch-Setup-Scripts` directory and the script ,before running the script. You can just get the script using curl (see 
[Arch-Setup-Scripts/README.md](https://github.com/Ruturajn/Dotfiles/tree/main/Arch-Setup-Scripts)), it will clone this repo and do the needfull.*
- *The Arch Install Script adds a user, partitions the disk, does a base Arch Installation etc. (see [Arch-Setup-Scripts/README.md](https://github.com/Ruturajn/Dotfiles/tree/main/Arch-Setup-Scripts)).*
- *The `picom.conf` file here, is to be used with the original picom. For [Jonaburg's Fork of picom](https://github.com/jonaburg/picom),
  I use `jonaburg_picom.conf`. If you want to use jonaburg-picom use that.*
- If you don't see the `wifi` widget show up, change line `364` in [qtile/config.py](https://github.com/Ruturajn/Dotfiles/blob/main/qtile/config.py)
  to your network interface.
- *To use the [bright_control](https://github.com/Ruturajn/Dotfiles/blob/main/qtile/bright_control) script, the user will need to be a part of the 
  `video` group. This can be done by : `$ sudo usermod -aG video $USER`.*

If you are using the [Arch_Setup_Install.sh](https://github.com/Ruturajn/Dotfiles/blob/main/Arch-Setup-Scripts/Arch_Setup_Install.sh) script all of 
these things mentioned about editing files, picom configs (It will also ask you which fork of picom you require and place the default config
from that fork in `~/.config/picom/picom.conf`), and adding your user to the groups will be taken care of by the script. The script will also
backup your `$HOME/.config` directory before making any changes, so you will not loose any data. **_The Setup Scripts do not support neovim setup as of
yet, it will be added soon_**.

<br />

## Setup Details

| Category | Tool Used |
| --- | --- |
| Window Manager | [Qtile](https://github.com/qtile/qtile) (with [Qtile-Extras](https://github.com/elParaguayo/qtile-extras)) |
| Terminal | [Alacritty](https://github.com/alacritty/alacritty) |
| Shell    | [Fish](https://github.com/fish-shell/fish-shell) (with [Oh-my-fish](https://github.com/oh-my-fish/oh-my-fish)) |
| Compositor | [Jonaburg's Fork of picom](https://github.com/jonaburg/picom) |
| Application Launcher | [Rofi](https://github.com/davatorium/rofi) | 
| Text Editor | [Vim](https://github.com/vim/vim) or [Neovim](https://github.com/neovim/neovim) |
| Browser | [Brave](https://brave.com/) |
| Notifications | [Dunst](https://github.com/dunst-project/dunst) |
| File Manager | [Nemo](https://github.com/linuxmint/nemo) |
| Fonts | [Fantasque Sans Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FantasqueSansMono/Regular/complete), [JetBrains Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete), [Fontawesome Font](https://github.com/FortAwesome/Font-Awesome) and [Material Design Icon Font](https://github.com/google/material-design-icons/blob/master/font/MaterialIcons-Regular.ttf) |
| Fetch Program | [pfetch](https://github.com/dylanaraps/pfetch), [fm6000](https://github.com/anhsirk0/fetch-master-6000) and [nerdfetch](https://github.com/ThatOneCalculator/NerdFetch) |
| Terminal Programs | [cava](https://github.com/karlstav/cava), [bashtop](https://github.com/aristocratos/bashtop), [pipes.sh](https://github.com/pipeseroni/pipes.sh), [cmatrix](https://github.com/abishekvashok/cmatrix) and [cbonsai](https://gitlab.com/jallbrit/cbonsai) |
| Theme | [Catppuccin](https://github.com/catppuccin/catppuccin) |

<br />

## Screenshots
![Arch-Rice-1](https://user-images.githubusercontent.com/56625259/174470042-5732da0a-d178-40c5-a8e4-790938f29d74.png)

![Arch-Rice-2](https://user-images.githubusercontent.com/56625259/174470046-ff2404c9-5f2a-4323-86a7-6f54690689c1.png)

![Arch-Rice-Rofi](https://user-images.githubusercontent.com/56625259/174470048-dbf91f68-9c13-4aaa-912b-71afc9326c8d.png)

![Arch-Rice-Wifi](https://user-images.githubusercontent.com/56625259/174470061-d0c25b4c-ebcc-4826-893c-d258dabc2f4d.png)

![Arch-Rice-PowerMenu](https://user-images.githubusercontent.com/56625259/174470067-dd74b2a6-99c1-453b-a454-a8231f23fe00.png)

## Screenshots (Showing Volume and Brightness Control)
<details>
<summary>Old Screenshots</summary>
<br>

![Arch_Rice_Qtile](https://user-images.githubusercontent.com/56625259/170982950-a64198cd-11c6-4372-b731-699f6e24422f.png)

![Arch_Rice_Qtile_1](https://user-images.githubusercontent.com/56625259/170983002-f8f7a216-383c-4a12-967f-8c12be56008f.png)

![Arch_Rice_Qtile_Rofi](https://user-images.githubusercontent.com/56625259/170983036-b79e3f1c-ad1e-4a70-a4b0-2b106fefdbeb.png)

![Arch_Rice_Qtile_Vol-Up](https://user-images.githubusercontent.com/56625259/170983071-5ced2d72-36a0-40ff-8742-ea7f110885e1.png)

![Arch_Rice_Qtile_Vol-Down](https://user-images.githubusercontent.com/56625259/170983084-7ebc4cdb-5bdf-447d-90f2-37a14d1538ff.png)

![Arch_Rice_Qtile_Vol-Mute](https://user-images.githubusercontent.com/56625259/170983101-205fc931-5138-4d9b-a145-4cedd5ab8e1e.png)

![Arch_Rice_Qtile_Vol-UnMute](https://user-images.githubusercontent.com/56625259/170983129-452a26be-e0ee-4194-9e9f-35296a9c6be6.png)

![Arch_Rice_Qtile_Brightness](https://user-images.githubusercontent.com/56625259/170983161-d5827eee-dd7f-406a-95bd-a026cfc34b20.png)

<br />
  
</details>
