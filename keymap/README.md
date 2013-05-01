The file sould be put

```bash
/usr/share/X11/xkb/symbols/comprehensive
```

To have gnome reflect the changes, set this on the `/usr/share/X11/xkb/rules/evdev.xml`

```xml
    <layout>
      <configItem>
        <name>comprehensive</name>
        <shortDescription>comprehensive</shortDescription>
        <description>comprehensive</description>
        <countryList>
          <iso3166Id>US</iso3166Id>
        </countryList>
        <languageList>
          <iso639Id>en</iso639Id>
        </languageList>
      </configItem>
      <variantList>
        <variant>
          <configItem>
            <name>us</name>
            <description>comprehensive us</description>
          </configItem>
        </variant>
        <variant>
          <configItem>
            <name>br</name>
            <description>comprehensive br</description>
          </configItem>
        </variant>
      </variantList>
    </layout>
```
