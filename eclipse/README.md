INSTRUKCJA KONFIGURACJI ECLIPSE

Czyli jak od zera skonfigurować wszystko na nowej platformie/na nowej instalacji eclipse po mojemu.

1. Oczywiście - pobranie eclipse/Atollica/SimplicityStudio itp.
2*. Pobranie dodatków z EclipseMarketplace (dodatki będą stopniowo dopisywane tutaj):
	- DarkestDark
	- Vrapper!!! + skrót do niego w postaci Alt+V
	- EasyShell  - domyślnie służy do otwierania rzeczy w explorerze, ale od tego mam też skróty - dla mnie fajną rzeczą jest możliwość skopiowania ścieżki do pliku z poziomu klawiatury Alt+Shift+E i wybrać opcję. TODO - poczaić więcej jego możliwości!
	- FluentMark (wcześniej tu był Markdown Text Editor) - opcjonalne/dla repo bloga.
	- Yaml Editor - też opcjonalne
3*. Ustawienia klawiszy:
	- File->Import->General->Preferences
	- z katalogu "key_bindings"
4*. Ustawienie motywu - opis wraz z plikami w katalogu theme
5*. Ustawienie szablonów funkcji itp - z pliku "moj_szablon_szablony_funkcji.xml"
6*. Ustawienie formattera kodu - z pliku "moj_szablon_kod_formatowanie"

Konfiguracja takiego nowego workspace to ok 10 minut niestety.

Jednorazowo:

1. Do zrobienia w systemie - wylaczenie obracania monitorow - ten sam skrot jest wykorzystywany w eclipsie do kopiowania bloków - w katalogu znajduje sie screen jak to ustawic.

Nową instalację eclipse trzeba skonfigurować ręcznie - dograć wszystkie pluginy itp.

Pluginy są współdzielone przez wszystkie workspace - trzeba je jedynie pouruchamiać i można to zrobić podmianą plików konfuguracyjnych.
\* przy numerkach oznacza, że można to skonfigurować poprzez skopiowanie tych plików konfiguracyjnych - czyli większość da radę tak ogarnąć.
Dla "gołego elcipse CDT" można to potem robić poprzez kopiowanie plików z katalogu:
```
.metadata/.plugins/org.eclipse.core.runtime/.settings 
```
pomiędzy workspace'ami - mamy trochę klików mniej dzięki temu, a jednak narazie eclipse plasuje się u mnie na top1 jeśli chodzi o IDE (2020r).

Głównie z powodu łatwej integracji z Vrapperem - tryby Vim'a w innych IDE są gorsze.

UWAGA - wersje eclipse będę sobie backupował na gDrive - żeby mieć pewność, że aktualnie wszędzie używam tego samego.

UWAGA2 - sprawdzić na ile jest to kompatybilne z Atollicami/MCUExpressami itp - czy nic się nie wywali po takiej podmiance.