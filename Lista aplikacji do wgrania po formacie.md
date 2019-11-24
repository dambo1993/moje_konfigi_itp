### Narzędzia "ulatwiajace" prace"

1. Executor - mega launcher
	- http://executor.dk/
	- apki "w nim"
		- timer <czas> <napis>		
2. 7+ Taskbar Numberer - numerki na pasku zadan - ale w win 10 już są wbudowane + w sumie już zawsze mam tak samo poukładane
	- https://rammichael.com/7-taskbar-numberer
3. Ditto - historia schowka systemowego
	- https://ditto-cp.sourceforge.io/
4. AutoHotKey - mega skrypty/makra
	- https://www.autohotkey.com/
5. Desktop OK - zapisanie pozycji ikon gdy zmienia sie uklad monitorow
6. CMDer - zamiennik CMD na windowsie
7. Easy Window Switcher - do przechodzenia pomiedzy oknami tego samego typu (jak np explorer) za pomocą Alt+`
8. Hexplorer - do podglądu plików hex.
9. wget dla windowsa - http://gnuwin32.sourceforge.net/packages/wget.htm
10. yEd - do rysowania diagramów

### Porównywarki plików

1. BeyondCompare - mega kombajn, można pomijać "minory", uwzględnia składnie języka itp! stosowany do "integracji"
	- porównuje też binarki i pliki hex
	- porównuje też całe katalogi itp
	- słabo radzi sobie z obrazami
2. Winmerge - opensourcowa mega apka, zastępiona w sumie przez BC
	- daje radę do obrazków
		- jako Overlay wybieramy Alpha i możemy "ściemniać" różnice
		- ciekawa
3. https://www.diffchecker.com/ online + wersja desktop też jest
	- mega porównuje obrazy!!!
	- nadaje się do porównywania obrazków z EAGLE
	- działa płynniej dla obrazów niż Winmerge
4. Meld 
	- spoko, ale to zastąpił BeyondCompare

### Menagery plików

1. total commander oczywiście (ale głównie do FTPów)
2. ranger+CygWin - dziwne połączenie, ale dobrze działa + konfigi do tego wszystkiego z repa dotfiles
3. ViFM - kiedyś, ale teraz całkowicie zastąpiony rangerem!

### Typowo narzedziowe

1. Moba Xterm - klient SSH, Serial portu itp
2. ImDisk - do ustawienia RamDisków na windowsie
	- ImDisk Virtual Disk driver
	- RamDisk Configuration - pod ta nazwa tego szukac w executorze
3. Advanced IP scanner - do wyszukiwania urządzeń w sieci.
4. Device monitoring studio - apka do wszystkich rzeczy z hardware na embedded!
5. Free Virtual Serial Ports od HDDSoftware - virtualne porty COM, łączenie ich itp(na linuxie z tym nie ma problemu)

### Typowo narzedziowe - MQTT

1. MQTT.fx - bardzo fajny klient, fajnie dziala z AWSem(device Shadow) i mozna definiowac swoje przyciski
2. MQTT Explorer - kombajn do MQTT, ale bardziej do lokalnych/customowych serwerków/brokerów

### Nagrywanie itp

1. Carnac - wyświetlanie wciśniętych klawiszy na ekranie

### IDE/Edytory tekstu

1. Eclipse - wiadomo + konfigi do niego z tego repo z katalogu eclipse.
2. Visual Studio Code
	- obsługa pythona
	- Eclipse Keymap - zeby się milej pracowało
	- Markdown Preview Enhanced
	- Markdownlint
	- PlantUML
	- PlantUML Previewer
	- Graphviz Preview
3. MarkdownPad - edytor/przeglądarka Markdownów - aktualnie zastąpiona przez pluginy do VSC.


### Apki dodane do patha

1. Hexplorer -> hexplo <nazwa pliku do uruchomienia>

### Ogólne

1. Flux - żeby trochę oczy oszczędzić monitorami

### Przegladarki

Tu zarówno używam FF jak i chrome - zależy czy w pracy/domu.

Do dogrania do przeglądarek:
1. Vimium oczywiście
	- notka - do wychodzenia z address bara można użyć wejścia i wyjścia z wyszukiwania (CTRL+F)
	- mój skrypt do Vimium do wgrania w ustawienia:
```
# odwrocenie przewijania kart - tzn tak jak PgUp i PgDn:
unmap J
unmap K
map J nextTab
map K previousTab
```
2. Google Search Keyboard Shortcuts - do poruszania się w wyszukiwaniach google latwiej - jako uzupełnienie Vimium'a
3. LeechBlock NG :)
4. Video Speed Controller - i śmigać na 1.5
5. Youtube Collection Manager - ładne zarządzanie subskrypcjami

### Aplikacje do sprawdzenia kiedyś

1. MaxLauncher - jako uzupełnienie executora i AHK - a bardziej jako zamiennik dmenu z linuxa, bo nic mądrzejszego nie znalazłem z menu, a nie komendami
	- https://maxlauncher.sourceforge.io/	
2. hunt-and-peck - Vimium, ale dla wszystkich okien - jednak aktualnie trochę zbyt wolno to reaguje :( - może potem warto poszukać jakiejś alternatywy, albo całkiem przejść na Arch
	- https://github.com/zsims/hunt-and-peck
3. KeyRocket - do nauki skrotow na windowsie, ale apka komercyjna - 100 dolarow :(
4. scoop - manager pakietów dla windowsa - jak chocolate - https://medium.com/@pranjalpaliwal/perfect-dev-environment-on-windows-the-easiest-way-691c649850eb
5. Ogólnie obczaić softy od HDD software, bo wszystkie czasem by się przydały + dają darmowe wersje, które też są użyteczne bez kupowania - mają jakieś hexviewery itp

### Lista aplikacji linuxowych - do rozbudowania i potem oskryptowania i "odotfilowania"

1. ranger - mały, fajny manager plików
2. zsh - wiadomo
