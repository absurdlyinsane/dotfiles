function gens --wraps='doas nixos-rebuild list-generations' --description 'alias gens=doas nixos-rebuild list-generations'
  doas doas nixos-rebuild list-generations $argv
        
end
