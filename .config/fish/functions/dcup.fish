function dcup --wraps='doas docker compose down && doas docker-compose up -d' --description 'alias dcup=doas docker compose down && doas docker-compose up -d'
  doas docker compose down && doas docker-compose up -d $argv
        
end
