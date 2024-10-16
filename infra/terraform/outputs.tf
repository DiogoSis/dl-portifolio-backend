output "lambda_function_arn" {
  value = aws_lambda_function.portfolio_backend.arn
}

output "api_gateway_url" {
  value = aws_api_gateway_deployment.portfolio_deployment.invoke_url
}

output "dynamodb_table_names" {
  value = var.dynamodb_table_names
}
