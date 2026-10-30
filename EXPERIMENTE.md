# GeoGebra zum Ausprobieren

Fork: https://github.com/YutoLz/geogebra

Wir arbeiten auf dem Zweig `playground`. `origin` zeigt auf den eigenen Fork,
`upstream` auf das Original. Der Zweig `main` bleibt als Ausgangspunkt erhalten.

## Start unter Windows

Im Repository mit PowerShell:

```powershell
.\dev.ps1
```

Voraussetzung: JDK 17. Auf diesem Rechner liegt es projektbezogen neben dem
Repository unter `../tools/`; der Starter findet es automatisch.
An anderen Rechnern `JAVA_HOME` auf ein installiertes JDK 17 setzen.
Gradle wird dort bei Bedarf vom offiziellen Wrapper heruntergeladen.
Der erste Start braucht Internetzugang fuer die Build-Abhaengigkeiten.

Sobald der Entwicklungsserver bereit ist, im Browser
http://localhost:8888/graphing.html aufrufen. Die erste GWT-Kompilierung kann
einige Minuten dauern. Falls das GWT-Fenster erscheint, dort `graphing.html`
auswaehlen und `Launch Default Browser` verwenden.
Beenden mit Strg+C und gegebenenfalls das GWT-Fenster schliessen.

```powershell
.\dev.ps1 check     # Java-Code der Web-App kompilieren
.\dev.ps1 desktop   # alternativ GeoGebra Classic 5 starten
```

## Wo wir kleine Dinge aendern koennen

- `source/web/web/src/main/resources/scss/`: Farben und Darstellung der Web-App.
- `source/web/web/src/main/java/org/geogebra/web/`: Web-Oberflaeche und Aktionen.
- `source/shared/common/src/main/java/org/geogebra/common/`: gemeinsame Mathematiklogik.

Java-Aenderungen werden im GWT-Entwicklungsmodus beim Neuladen kompiliert.
Nach Aenderungen an Build-Dateien den Starter neu starten.

## Aenderungen sichern

```powershell
git status
git add <geaenderte-Dateien>
git commit -m "Describe experiment"
git push
```

Das veroeffentlicht die Aenderungen nur im eigenen Fork.
Lizenz- und Copyright-Hinweise des Originals beibehalten.
