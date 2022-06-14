function yt-dlp-audio --wraps='yt-dlp --embed-thumbnail --audio-format mp3 --output "%(title)s.%(ext)s" --extract-audio --split-chapters' --description 'alias yt-dlp-audio yt-dlp --embed-thumbnail --audio-format mp3 --output "%(title)s.%(ext)s" --extract-audio --split-chapters'
  yt-dlp --embed-thumbnail --audio-format mp3 --output "%(title)s.%(ext)s" --extract-audio --split-chapters $argv; 
end
