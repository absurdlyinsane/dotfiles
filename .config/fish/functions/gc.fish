function gc --wraps='doas nix-collect-garbage -d && doas rm /nix/var/nix/gcroots/auto/*' --description 'alias gc=doas nix-collect-garbage -d && doas rm /nix/var/nix/gcroots/auto/*'
  doas nix-collect-garbage -d && doas rm /nix/var/nix/gcroots/auto/* $argv
        
end
