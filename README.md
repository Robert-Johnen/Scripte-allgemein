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
    Aufruf: 
    `~ $> _colorCodesPrompt`      
    `# exportiert Variablen an die Shell, um farbige Ausgaben zu ermöglichen:`  
    `~ $> echo "${MAGENTA} magentafarbiger Text ${GREEN} grüner Text ${CRESET} Text mit Standardfarbe"`  
    `# wird auch von Funktion _mxPSx genutzt.`  
  
  --> Funktion *_myPSx*:  
    Aufruf: `robert@robertmobil:~ $> _myPSx 0`  
    `>>> Do Feb 09 | 12:24:11 Uhr >>>`  
    `<<< Do Feb 09 | 12:24:11 Uhr <<<`  
    ` ✓ | Mails: 0 | lfd. bg-Jobs: 0 | lfd. screen: 0 | lfd. tmux: 1`  
    `[~] | Links: 12 | Verzeichnisse: 58 | Dateien: 35 | FIFOs: 0`  
    Aufruf: 
    `robert@robertmobil:~ $> _myPSx 1`  
    `>>> Do Feb 09 | 12:28:21 Uhr >>>`  
    ` ✓ robert@robertmobil:~ $> bla`
    `Wenn 'bla' kein Tippfehler ist, können Sie command-not-found benutzen, um das Paket zu finden, das den Befehl enthält, z. B.: cnf bla`   
    ` ✗ (127) robert@robertmobil:~ $>`  
    
  --> Funktion *_f2clb*:  
    Aufruf: `~ $> _f2clb /Pfad/Datei [01]`  
    `# pipt den Inhalt der Datei in die X-Zwischenablage (0 oder kein 2. Parameter, mit Intro und Abspann, 1 ohne Intro und abspann) und wird von der Funktion _dc benötigt. Funktioniert auch mit Wayland.`
    
  --> Funktion *_dc*:  
    Aufruf: `~ $> _dc Befehl`  
    `# führt den Befehl 'Befehl' aus, macht eine Ausgabe auf stdout und eine in die Datei /tmp/_dc.${USER}. Der Inhalt der Datei landet dabei direkt in der X-Zwischenablage.`
       
       
