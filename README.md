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

- snippet_add2path+rmpath - zwei Funktionen für die .alias, die den Suchpfad verändern

~> add2path /Ver/zeich/nis fügt dem Suchpfad ($PATH) /Ver/zeich/nis hinzu und enfernt doppelt vorkommende Verzeichnisse

~> rmpath /Ver/zeich/nis entfernt /Ver/zeich/nis aus dem Suchpfad ($PATH)

- snippet_file2clipboard - schiebt eine Datei von der Konsole in die X-Zwischenablage

~> file2xclipbd /Verzeichnis/Datei

- README.md - Diese Datei
