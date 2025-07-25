 { config, lib, pkgs, ... }:

{
#
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/3024.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/apathy.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/apprentice.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/ashes.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-cave-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-cave.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-dune-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-dune.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-estuary-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-estuary.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-forest-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-forest.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-heath-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-heath.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-lakeside-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-lakeside.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-plateau-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-plateau.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-savanna-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-savanna.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-seaside-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-seaside.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-sulphurpool-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atelier-sulphurpool.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/atlas.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-mirage.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/aztec.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/bespin.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-bathory.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-burzum.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-dark-funeral.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-gorgoroth.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-immortal.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-khold.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-marduk.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-mayhem.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-nile.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-venom.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/blueforest.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/blueish.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/brewer.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/bright.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/brogrammer.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/brushtrees-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/brushtrees.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/caroline.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/chalk.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/circus.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/classic-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/classic-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/codeschool.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/colors.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/cupcake.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/cupertino.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/da-one-black.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/da-one-gray.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/da-one-ocean.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/da-one-paper.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/da-one-sea.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/da-one-white.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/danqing-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/danqing.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/darcula.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/darkmoss.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/darktooth.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/darkviolet.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/decaf.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/deep-oceanic-next.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/default-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/default-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/digital-rain.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/dirtysea.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/edge-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/edge-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/eighties.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/embers-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/embers.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/emil.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/equilibrium-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/equilibrium-gray-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/equilibrium-gray-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/equilibrium-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/eris.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/espresso.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/eva-dim.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/eva.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/evenok-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/flat.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/framer.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/fruit-soda.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gigavolt.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/github-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/github.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/google-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/google-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gotham.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/grayscale-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/grayscale-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/greenscreen.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruber.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-pale.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-soft.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-light-hard.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-light-medium.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-light-soft.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-light.yaml";
      stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-soft.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-light-hard.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-light-medium.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-light-soft.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/hardcore.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/harmonic16-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/harmonic16-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/heetch-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/heetch.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/helios.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/hopscotch.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/horizon-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/horizon-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/horizon-terminal-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/horizon-terminal-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/humanoid-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/humanoid-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/ia-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/ia-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/icy.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/irblack.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/isotope.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/jabuti.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa-dragon.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/katy.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/kimber.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/lime.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/macintosh.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/marrakesh.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/materia.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/material-darker.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/material-lighter.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/material-palenight.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/material-vivid.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/material.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/measured-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/measured-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/mellow-purple.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/mexico-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/mocha.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/monokai.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/moonlight.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/mountain.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/nebula.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/nord-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/nova.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/ocean.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/oceanicnext.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/one-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/outrun-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/oxocarbon-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/oxocarbon-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/pandora.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/papercolor-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/papercolor-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/paraiso.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/pasque.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/phd.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/pico.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/pinky.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/pop.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/porple.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/precious-dark-eleven.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/precious-dark-fifteen.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/precious-light-warm.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/precious-light-white.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/primer-dark-dimmed.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/primer-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/primer-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/purpledream.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/qualia.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/railscasts.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/rebecca.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-dawn.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/saga.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/sagelight.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/sakura.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/sandcastle.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/selenized-black.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/selenized-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/selenized-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/selenized-white.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/seti.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/shades-of-purple.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/shadesmear-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/shadesmear-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/shapeshifter.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/silk-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/silk-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/snazzy.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/solarflare-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/solarflare.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/solarized-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/spaceduck.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/spacemacs.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/sparky.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/standardized-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/standardized-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/stella.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/still-alive.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/summercamp.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/summerfruit-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/summerfruit-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/synth-midnight-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/synth-midnight-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tango.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tarot.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tender.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/terracotta-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/terracotta.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-city-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-city-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-city-terminal-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-city-terminal-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-moon.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-terminal-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-terminal-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-terminal-storm.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark-terminal.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyodark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tomorrow-night-eighties.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tomorrow-night.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tomorrow.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/tube.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/twilight.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/unikitty-dark.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/unikitty-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/unikitty-reversible.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/uwunicorn.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/valua.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/vesper.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/vice.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/vulcan.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/windows-10-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/windows-10.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/windows-95-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/windows-95.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/windows-highcontrast-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/windows-highcontrast.yaml ";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/windows-nt-light.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/windows-nt.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/woodland.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/xcode-dusk.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/zenbones.yaml";
#     stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/zenburn.yaml";
#
}
