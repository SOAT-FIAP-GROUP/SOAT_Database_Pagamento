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

#==================================================
#---------------- Dynamo Entrega ------------------
#==================================================

resource "aws_dynamodb_table" "producao_entrega" {
  name           = "Entrega"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "codigo"

attribute {
  name = "codigo"
  type = "S"
}
  ttl {
    attribute_name = "TimeToExist"
    enabled        = true
  }

  tags = {
    Name        = "dynamodb-table-producao-entrega"
    Environment = "dev"
  }
}

#==================================================
#------------- Dynamo Fila de Pedido --------------
#==================================================

resource "aws_dynamodb_table" "producao_fila_pedido" {
  name           = "Fila_Pedido"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "codigo"

attribute {
  name = "codigo"
  type = "S"
}

attribute {
  name = "pedidoCodigo"
  type = "S"
}

global_secondary_index {
  name            = "pedidoCodigo"
  hash_key        = "pedidoCodigo"
  projection_type = "ALL"
}
  ttl {
    attribute_name = "TimeToExist"
    enabled        = true
  }

  tags = {
    Name        = "dynamodb-table-producao-fila-pedido"
    Environment = "dev"
  }
}