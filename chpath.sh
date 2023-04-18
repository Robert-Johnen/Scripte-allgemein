#!/bin/bash
# source in .bashrc

_add2Path() {
  ### Pfad erweitern und von Duplikaten bereinigen
  local lv_tmppath="${1}:${PATH}"          
  #  temporäre Pfadvariable
  local lv_newpath                         
  # leere Variable für neuen Pfad ohne Duplikate
  local lv_i                               
  # Iterator
  for lv_i in ${lv_tmppath//:/ }              
  # iteriere über alle Elemente des Pfades
    do 
    case ":$lv_newpath:" in                
    # enthält der neue Pfad mit : davor und dahinter irgendwie 
      *":$lv_i:"*) : ;;                    
      # den zu iterierenden Teil mit : davor und dahinter --> tue nichts
      *) lv_newpath="${lv_newpath}:${lv_i}";;    
      # sonst klebe Iterator hinten an neuen Pfad dran
      esac 
    done 
  export PATH="${lv_newpath/:/}"
  # neue Pfadvariableexportieren
  return 0
  # Exitcode der Funktion auf jeden Fall 0
  }

_rmPath() {
  ### Pfad reduzieren
  local lv_tmppath=":${PATH}:"
  # vorne und Hinten : drankleben
  local lv_newpath="${lv_tmppath/:$1:/:}"
  # hole aus Pfad den angegebenen Parameter raus, wenn er drinsteht
  lv_newpath="${lv_newpath#:}"
  export PATH="${lv_newpath%:}"
  # nimm die : am Ende und am Anfang wieder weg und exportiereden Pfad
  return 0
  # Exitcode 0
  }
