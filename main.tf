#==================================================
#--------------- Dynamo Pagamento -----------------
#==================================================

resource "aws_dynamodb_table" "pagamento" {
  name           = "Pagamento"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

attribute {
  name = "id"
  type = "S"
}
  ttl {
    attribute_name = "TimeToExist"
    enabled        = true
  }

  tags = {
    Name        = "dynamodb-table-pagamento"
    Environment = "dev"
  }
}