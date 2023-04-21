_f2xcb() {
  ### Inhalt vom Datei (als 1. Parameter uebergeben) soll ab ins Clipboard
  local lv_datei="${1}"
  # Dateiname aus Parameter holen
  local lv_nointro="${2:-0}"
  # Standard (2. Parameter leer) ist mit Intro und Abspann in die Zwischenablage >0 dann ohne Intro und Abspann
  [ -n $DISPLAY ] || exit 129
  # brich ab, wenn kein Display offen bzw. kein Display--Server da
  local lv_ccommand="xclip -i -selection clipboard" #XOrg
  # Standardkommando fuer Zwischenablage Display-Server XOrg 
  echo $DESKTOP_SESSION | grep way 1>/dev/null 2>&1 && lv_ccommand="wl-copy" #Wayland
  # oder Umschalten auf anderes Kommando wenn Wayland
  if grep -Iq . "${lv_datei}"
    # Datei existiert und ist beliebiger Text (kein Binary)
    # das funktioniert ;-) Ich habe keinen Bock 
    # Mime-Type_n_(sic!) zu prüfen
    then
    {
    [ $lv_nointro -eq 0 ] && echo -e "----8<---- Datei: ${lv_datei##*/} ----8<----\n"
    # Intro auf stdout, wenn gewuenscht
    cat "${lv_datei}" 
    # Dateiinhalt auf stdout
    [ $lv_nointro -eq 0 ] && echo -e "\n---->8---->8---- EOF ---->8---->8----"  
    # Abspann auf stdout, wenn gewuenscht
    } | eval "${lv_ccommand}" 
    # stdout in Kommando fuer Zwischenablage pipen
    else
    echo "${lv_datei}" | eval "${lv_ccommand}"
    fi
  }
