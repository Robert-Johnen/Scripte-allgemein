# Scripte-allgemein

- detox (Bash-Script) - bereinigt einen Datei- oder Verzeichnisnamen von einigen Sonderzeichen (per sed)

- .detox - enthält die sed-Befehle für Script _detox_

- getMS-InstKey (Bash-Script) - liest den MS-Installationsschlüssel aus dem UEFI/BIOS aus

- kbdremap.sh - meine tastatur ist auf einem refurbished-Computer mit neu beschrifteter Tastatur:
kein < und keine > Taste und kein | Pipe-Zeichen. das definiere ich mit diesen Befehlszeilen um
CAPS-LOCK und SHIFT-CAPS-LOCK werdn zu < und >, SHIFT-SPACE zum | Pipe-Zeichen

- kbdremap.service - hiermit starte ich das Script _kbdremap.sh_  als System-Service (mit systemctl) und
habe dann für alle Terminals und X die tasten zur Verfügung

- README.md - Diese Datei
