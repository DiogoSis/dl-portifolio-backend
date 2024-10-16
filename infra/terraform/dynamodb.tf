resource "aws_dynamodb_table" "elogios_ideias" {
  name         = var.dynamodb_table_names["elogios_ideias"]
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "me_siga" {
  name         = var.dynamodb_table_names["me_siga"]
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "consultoria" {
  name         = var.dynamodb_table_names["consultoria"]
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "oferta_trabalho" {
  name         = var.dynamodb_table_names["oferta_trabalho"]
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}
