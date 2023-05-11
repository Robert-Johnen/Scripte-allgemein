#!/bin/bash
# source in .bashrc
_colorCodesPrompt() {
  ### setzt Variablen fuer die Formatcodes am Prompt im Terminal
  # Formatierungen
  export FTNORM=$(echo -en '\001\033[0m\002')
  export FTBOLD=$(echo -en '\001\033[1m\002')
  export FTDIMM=$(echo -en '\001\033[2m\002')
  export FTITALIC=$(echo -en '\001\033[3m\002')
  export FTULINE=$(echo -en '\001\033[4m\002')
  export FTBLINK=$(echo -en '\001\033[5m\002')
#  export FTGRAY=$(echo -en '\001\033[6m\002')
  export FTINVERT=$(echo -en '\001\033[7m\002')
  export FTHIDE=$(echo -en '\001\033[8m\002')
  export FTSTRIKE=$(echo -en '\001\033[9m\002')
  # Vordergrundfarben
  export BLACK=$(echo -en '\001\033[30m\002')
  export RED=$(echo -en '\001\033[31m\002')
  export GREEN=$(echo -en '\001\033[32m\002')
  export YELLOW=$(echo -en '\001\033[33m\002')
  export BLUE=$(echo -en '\001\033[34m\002')
  export MAGENTA=$(echo -en '\001\033[35m\002')
  export CYAN=$(echo -en '\001\033[36m\002')
  export GRAY=$(echo -en '\001\033[37m\002')
  export DGRAY=$(echo -en '\001\033[90m\002')
  export DRED=$(echo -en '\001\033[91m\002')
  export DGREEN=$(echo -en '\001\033[92m\002')
  export DYELLOW=$(echo -en '\001\033[93m\002')
  export DBLUE=$(echo -en '\001\033[94m\002')
  export DMAGENTA=$(echo -en '\001\033[95m\002')
  export DCYAN=$(echo -en '\001\033[96m\002')
  export WHITE=$(echo -en '\001\033[97m\002')
  export STDFG=$(echo -en '\001\033[39m\002')
  # Hintergrundfarben
  export BBLACK=$(echo -en '\001\033[40m\002')
  export BRED=$(echo -en '\001\033[41m\002')
  export BGREEN=$(echo -en '\001\033[42m\002')
  export BYELLOW=$(echo -en '\001\033[43m\002')
  export BBLUE=$(echo -en '\001\033[44m\002')
  export BMAGENTA=$(echo -en '\001\033[45m\002')
  export BCYAN=$(echo -en '\001\033[46m\002')
  export BGRAY=$(echo -en '\001\033[47m\002')
  export BDGRAY=$(echo -en '\001\033[100m\002')
  export BDRED=$(echo -en '\001\033[101m\002')
  export BDGREEN=$(echo -en '\001\033[102m\002')
  export BDYELLOW=$(echo -en '\001\033[103m\002')
  export BDBLUE=$(echo -en '\001\033[104m\002')
  export BDMAGENTA=$(echo -en '\001\033[105m\002')
  export BDCYAN=$(echo -en '\001\033[106m\002')
  export BWHITE=$(echo -en '\001\033[107m\002')
  export STDBG=$(echo -en '\001\033[49m\002')
  # Standardkombinationen
#  export STDFG=$GRAY
#  export STDBG=$BBLACK
  export STDFT=$(echo ${FTNORM})
  export CGOOD=$(echo ${BLACK}${BGREEN})
  export CERROR=$(echo ${BLACK}${BRED})
  export CSTD=$(echo ${STDFT}${STDFG}${STDBG})
  export CRESET=$(echo ${FTNORM})
  # printf "${CRESET}"
  }

# bevor ich den irgendwad verändere, 
# speichere ich die Originalvariablen
# damit ich sie notfalls zurücksetzen kann
export PS0_orig="${PS0}"
export PS1_orig="${PS1}"
export PS2_orig="${PS2}"
export PS3_orig="${PS3}"
export PS4_orig="${PS4}"

_myPSx() {
  ### mein Definition eines Prompts
  _colorCodesPrompt
  # schoene bunte Welt machen
  local lv_myPSx="${1:-0}"
  # Parameter in lokale Variable einlesen, wenn leer dann 0 (mein Standard)
#set -o pipefail 
  # ich will eine Fehlermeldung, wenn auch nur ein Befehl in einer Pipe fehlschlägt
  # wird gebraucht wenn Fehler mit $? ausgelesen wird. bei ${PIPESTATUS[@]}
  # bekomme ich den Errorlevel von jedem Kommando in der Pipe
  case  $lv_myPSx in
    # wenn 0 dann wird mein Standardprompt gesetzt
    # 1 Langversion, 2 Kurzversion, 3 nur Arbeitsverzeichnis
    # alles andere Standard des Systems wieder herstellen
    0 ) # mein Standardprompt bunt ganz kurz "ssh:user@host:~ $>"
      export PS0=''
      export PS1='$([[ $UID -eq 0 ]] && echo ${RED} || echo ${DYELLOW})$([[ -z $SSH_CLIENT ]] || echo "ssh:")\u@\h:${CSTD}${BLUE}\w${CSTD} \$> '
      ;;
    1 ) # Prompt extrem informativ
      # Startzeit des Jobs vor der Ausführung anzeigen
      export PS0='>>> \d | \t Uhr >>>\n'
      # Ende-Zeit des Jobs anzeigen.
      # das ginge noch genauer, aber dann wird der Exitcode im Prompt vermasselt :-(. Der ist mir wichtiger.
      # Exitcode des letzten Prozesses sichern, Mails im Postfach / aktuelles Verzeichnis / laufende Hintergrundjobs / Mails im Postfach
      # Zahl der Links, Dateien, Verzeichnisse und FIFOs im akt. Verzeichnis
      # USER@HOST:PATH
      # das ganze schön bunt :-)
      export PS1='<<< \d | \t Uhr <<<\n$( { lv_pecode=${PIPESTATUS[@]}; lv_ecode=$(printf "${lv_pecode[*]}" | tr " " "\n" | sort -nr | head -n1); [[ "$lv_ecode" == "0" ]] && echo "${CGOOD} ✓ " || echo "${CERROR} ✗ (${lv_pecode[@]}) "; } )${CSTD} ${MAGENTA}| Mails: $(grep -c "^Return-Path: " /var/spool/mail/${USER} 2>/dev/null || echo -n "0") | lfd. bg-Jobs: \j | lfd. screen: $(screen -ls 2>/dev/null | grep Detached | wc -l) | lfd. tmux: $(tmux ls 2>/dev/null | wc -l)\n${RED}[${BLUE}\W${RED}]${CYAN} | Links: $(ls -al | grep -e ^l | wc -l) | Verzeichnisse: $(ls -al | grep -e ^d | wc -l) | Dateien: $(ls -al | grep -e ^- | wc -l) | FIFOs: $(ls -al | grep -e ^p | wc -l)\n${CSTD}$( [[ $UID -eq 0 ]] && echo ${RED} || echo ${DYELLOW})$([[ -z $SSH_CLIENT ]] || echo "ssh:")\u@\h:${BLUE}\w${CSTD} \$> '
      ;;
    2 ) # mein Standardprompt bunt in kurz "Errorlevel ssh:user@host:~ $>"
      export PS0=''
      export PS1='$( { lv_pecode=${PIPESTATUS[@]}; lv_ecode=$(printf "${lv_pecode[*]}" | tr " " "\n" | sort -nr | head -n1); [[ "$lv_ecode" == "0" ]] && echo "${CGOOD} ✓ " || echo "${CERROR} ✗ (${lv_pecode[@]}) "; } )${CSTD} $( [[ $UID -eq 0 ]] && echo ${RED} || echo ${DYELLOW})$([[ -z $SSH_CLIENT ]] || echo "ssh:")\u@\h:${BLUE}\w${CSTD} \$> '
      ;;
    3 ) # Prompt "~ $>"
      export PS0=''
      export PS1='${BLUE}\w${CSTD} \$> '
      ;;
    * ) # Originalprompt des Systems wiederherstellen
      export PS0="${PS0_orig}"
      export PS1="${PS1_orig}"
      ;;
    esac
  }
