#!/bin/bash

# Caminho do diretório dist após a build
DIST_DIR="dist"

# Nome do arquivo zip para Lambda
ZIP_FILE="main.zip"

# Nome do bucket S3
S3_BUCKET="dl-portifolio-backend"

# Caminho para o Lambda no S3
S3_KEY="lambda/$ZIP_FILE"

# Build do projeto
echo "Building the project..."
npm run build

# Verifica se o diretório dist foi gerado
if [ ! -d "$DIST_DIR" ]; then
  echo "Error: build directory '$DIST_DIR' not found!"
  exit 1
fi

# Compacta a pasta dist
echo "Zipping the dist folder..."
cd $DIST_DIR
zip -r ../$ZIP_FILE .
cd ..

# Sobe o zip para o S3
echo "Uploading $ZIP_FILE to S3 bucket..."
aws s3 cp $ZIP_FILE s3://$S3_BUCKET/$S3_KEY

# Limpa arquivos temporários
echo "Cleaning up..."
rm $ZIP_FILE

echo "Deploy finished. You can now provision resources manually using Terraform."
