# Scripte-allgemein

Scripte und kleine Schnipsel, die ab und zu mal zu gebrauchen sind.

- getMS-InstKey (Bash-Script) - Liest den MS-Installationsschlüssel aus den ACPI-Tabellen des UEFI/BIOS aus
Der Zugriff auf diese Tabellen benötigt root-Rechte (deswegen sudo im Script).

- kbdremap.sh (Shell-Script) - Meine Tastatur ist auf einem refurbished-Computer mit neu beschrifteter Tastatur. 
Ich habe darauf keine < und keine > Taste und kein | Pipe-Zeichen. Das definiere ich mit diesen Befehlszeilen um. 
CAPS-LOCK und SHIFT-CAPS-LOCK werden zu < und >, SHIFT-SPACE zum | Pipe-Zeichen. 
Am besten im Verzeichnis /usr/local/bin ablegen.

- kbdremap.service - hiermit starte ich das Script _kbdremap.sh_ als System-Service (mit systemctl) und 
habe dann für alle Terminals und X die Tasten ab Systemstart zur Verfügung

- README.md - Diese Datei
