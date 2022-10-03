rm html.zip
wget https://codeload.github.com/hanskimvz/K510Web/zip/refs/heads/main -O html.zip
unzip html.zip -d target/usr/
rm -rf target/usr/html
mv target/usr/K510Web-main target/usr/html
