# Scripte-allgemein

Scripte und kleine Schnipsel, die ab und zu mal zu gebrauchen sind.

- detox (Bash-Script) - bereinigt einen Datei- oder Verzeichnisnamen von einigen Sonderzeichen (per sed)
ist öfter schon mal Hilfreich, wenn man Dateien von Dateisystemen übernimmt, welche die Sonderzeichen 
falsch codiert haben

- .detox - enthält die sed-Befehle für Script _detox_

- getMS-InstKey (Bash-Script) - liest den MS-Installationsschlüssel aus den ACPI-Tabellen des UEFI/BIOS aus
Der Zugriff auf diese tabellen benötigt root-Rechte

- kbdremap.sh (Shell-Script) - meine tastatur ist auf einem refurbished-Computer mit neu beschrifteter Tastatur:
keine < und keine > Taste und kein | Pipe-Zeichen. Das definiere ich mit diesen Befehlszeilen um. 
CAPS-LOCK und SHIFT-CAPS-LOCK werden zu < und >, SHIFT-SPACE zum | Pipe-Zeichen. 
Am besten im Verzeichnis /usr/local/bin ablegen.

- kbdremap.service - hiermit starte ich das Script _kbdremap.sh_ als System-Service (mit systemctl) und 
habe dann für alle Terminals und X die Tasten abs Systemstart zur Verfügung

- README.md - Diese Datei
