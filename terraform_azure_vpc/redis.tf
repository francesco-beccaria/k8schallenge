resource "random_id" "server" {
  keepers = {
    azi_id = 1
  }

  byte_length = 8
}

resource "azurerm_redis_cache" "pr-redis" {
  name                = "${random_id.server.hex}"
  location            = "${azurerm_resource_group.producer.location}"
  resource_group_name = "${azurerm_resource_group.producer.name}"
  capacity            = 1
  family              = "P"
  sku_name            = "Premium"
  enable_non_ssl_port = false
  shard_count         = 3

  redis_configuration {
    maxclients         = 7500
    maxmemory_reserved = 2
    maxmemory_delta    = 2
    maxmemory_policy   = "allkeys-lru"
  }
}