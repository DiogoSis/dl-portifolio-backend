variable "aws_region" {
  description = "A região da AWS a ser utilizada"
  type        = string
  default     = "us-east-1"
}

variable "lambda_function_name" {
  description = "Nome da função Lambda"
  type        = string
  default     = "portfolio-backend"
}

variable "dynamodb_table_names" {
  description = "Nomes das tabelas DynamoDB para cada formulário"
  type        = map(string)
  default = {
    elogios_ideias   = "ELOGIOS_IDEIAS"
    me_siga          = "ME_SIGA"
    consultoria      = "CONSULTORIA"
    oferta_trabalho  = "OFERTA_TRABALHO"
  }
}

