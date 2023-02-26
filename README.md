# kurze Scripte

- getMS-InstKey (Bash-Script) - Liest den MS-Installationsschlüssel aus den ACPI-Tabellen des UEFI/BIOS aus
Der Zugriff auf diese Tabellen benötigt root-Rechte (deswegen sudo im Script).

- kbdremap.sh (Shell-Script) - Meine Tastatur ist auf einem refurbished-Computer mit neu beschrifteter Tastatur. 
Ich habe darauf keine < und keine > Taste und kein | Pipe-Zeichen. Das definiere ich mit diesen Befehlszeilen um. 
CAPS-LOCK und SHIFT-CAPS-LOCK werden zu < und >, SHIFT-SPACE zum | Pipe-Zeichen. 
Am besten im Verzeichnis /usr/local/bin ablegen.

- kbdremap.service - hiermit starte ich das Script _kbdremap.sh_ als System-Service (mit systemctl) und 
habe dann für alle Terminals und X die Tasten ab Systemstart zur Verfügung

- .alias - Funktionen und kurze Schnipsel, um das CLI für mich angenehmer zu machen:  
  --> Funktion *_colorCodesPrompt*:    
    `# exportiert Variablen an die Shell, um farbige Ausgaben zu ermöglichen`  
    
  --> Funktion *_myPSx [01234]*:  
    `# Ändert den Prompt so, wie ich ihne haben möchte, Standard ist bunt, " $? ssh:user@host:~ $> "`  
  
  --> Funktion *_add2Path /Verzeichnis*:
    `# Ergänzt den $PATH des Users um /Verzeichnis, wenn /Verzeichnis nicht existiert erfolgt eine Meldung darüber, ergänzt wird es aber`  
    
  --> Funktion *_rmPath /Verzeichnis*:
    `# Entfernt /Verzeichnis aus $PATH des Users`  
    
  --> Funktion *_f2clb /Pfad/Datei [01]*:  
    `# pipt den Inhalt der Datei in die X-Zwischenablage (2. Parameter: 0 oder nichts , mit Intro und Abspann (Standard), 1 ohne Intro und Abspann) und wird von der Funktion _dc benötigt. Funktioniert auch mit Wayland.`
    
  --> Funktion *_dc "command"*:  
    `# führt den Befehl 'command' aus, macht eine Ausgabe auf stdout und eine in die Datei /tmp/_dc.${USER}. Der Inhalt der Datei landet dabei direkt in der X-Zwischenablage.`  
    
  --> Funktion *_sucheSub String*:
    `# sucht die Buchstabenfolge "String" in jedem alias, jeder geladenen Funktion und allen ausführbaren Dateien im Pfad und wirft alle Fundstellen als Ergebnis aus`  
       
       
