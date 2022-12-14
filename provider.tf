terraform {
  
  required_providers {
    newrelic = {
        source = "newrelic/newrelic"
        version = "3.2.1"
    }
  }
}

provider "newrelic" {
  account_id = 3087301   # Your New Relic accNRAK-KAA0NS59T13Eount ID
  api_key = "NRAK-N96JFJ8YYZLFHYKMLORYUKN7L3L" # Your New Relic user key
  region  = "US"        # US or EU (defaults to US)
}