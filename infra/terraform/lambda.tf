resource "aws_lambda_function" "portfolio_backend" {
  function_name = var.lambda_function_name
  handler       = "dist/main.handler"
  runtime       = "nodejs16.x"
  role          = aws_iam_role.lambda_exec.arn
  filename = "dist/main.zip"
  timeout = 5
  memory_size = 128
}

resource "aws_api_gateway_rest_api" "portifolio_api" {
  name = "portfolio_api"
}

resource "aws_api_gateway_resource" "lambda_resource" {
  rest_api_id = aws_api_gateway_rest_api.portifolio_api.id
  parent_id = aws_api_gateway_rest_api.portifolio_api.root_resource_id
  path_part = "lambda"
}

resource "aws_api_gateway_method" "post_method" {
  rest_api_id = aws_api_gateway_rest_api.portifolio_api.id
  resource_id = aws_api_gateway_resource.lambda_resource.id
  http_method = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id            = aws_api_gateway_rest_api.portfolio_api.id
  resource_id            = aws_api_gateway_resource.lambda_resource.id
  http_method            = aws_api_gateway_method.post_method.http_method
  integration_http_method = "POST"
  type                   = "AWS_PROXY"
  uri                    = aws_lambda_function.portfolio_backend.invoke_arn
}

resource "aws_api_gateway_deployment" "portfolio_deployment" {
  depends_on = [aws_api_gateway_integration.lambda_integration]
  rest_api_id = aws_api_gateway_rest_api.portfolio_api.id
  stage_name  = "dev"
}