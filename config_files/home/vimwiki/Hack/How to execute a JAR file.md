# How to execute a JAR file
Here how you can install Java on the Deck and run the JAR relatively easily:

 * Download Java from here: https://adoptium.net/temurin/releases/ (you need to select: Linux, x64, JRE and 17 on the dropdown menus and get the first result)
 * Once you have downloaded extract it somewhere
 * (Optional) Rename the folder to just jdk-17-jre (it will make it easier to update Java if you need to, just replace the content with the newer version)
 * From your Home folder go into .local/share/applications (you'll need to show hidden folders to see the .local folder)
 * From here, right click anywhere and select create new text file and call it Java.desktop
 * Put the following content in it (make sure to replace the path to wherever you've put Java, mine is in /home/deck/Downloads):

```bash
[Desktop Entry]
Name=Java
Comment=Java
Keywords=java
Exec=/home/deck/Downloads/jdk-17-jre/bin/java -jar %f
Terminal=false
Type=Application
MimeType=application/x-java-archive
NoDisplay=true
```

After that you should be able to double click on your JAR and it should run.
