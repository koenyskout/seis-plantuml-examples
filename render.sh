#/bin/sh

if [ ! -f plantuml.jar ]; then
    wget https://github.com/plantuml/plantuml/releases/download/v1.2026.1/plantuml-1.2026.1.jar -O plantuml.jar
fi
java -jar plantuml.jar -version
find . -name "*.png" -exec rm {} \;
java -jar plantuml.jar "**/*.puml" -png

# Create a README.md in each directory with links to the puml files and the png images
# Each time, first the link, then the image, then the next link, etc.
# Also add the contents of the file as a code block
find * -not -name ".*" -type d -exec sh -c 'cd "$0" && echo "# Diagrams in $(basename "$0")" > README.md && for f in *.puml; do echo "## $f" >> README.md && echo "[Source]($f)\n" >> README.md && echo "![Diagram](${f%.puml}.png)" >> README.md && echo "\n\`\`\`plantuml" >> README.md && cat "$f" >> README.md && echo "\n\`\`\`\n" >> README.md; done' {} \;