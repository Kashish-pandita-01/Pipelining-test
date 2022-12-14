resource "newrelic_one_dashboard" "exampledash" {
  name        = "New Relic Terraform Example"
  permissions = "public_read_only"

  page {
    name = "New Relic Terraform Example"

    widget_billboard {
      title  = "Requests per minute"
      row    = 1
      column = 1
      width  = 6
      height = 3

      nrql_query {
        query = "FROM Transaction SELECT rate(count(*), 1 minute)"
      }
    }

    widget_bar {
      title  = "Average transaction duration, by application"
      row    = 1
      column = 7
      width  = 6
      height = 3

      nrql_query {
        account_id = 12345
        query      = "FROM Transaction SELECT average(duration) FACET appName"
      }

      # Must be another dashboard GUID
      linked_entity_guids = ["abc123"]
    }

    widget_bar {
      title  = "Average transaction duration, by application"
      row    = 4
      column = 1
      width  = 6
      height = 3

      nrql_query {
        account_id = 12345
        query      = "FROM Transaction SELECT average(duration) FACET appName"
      }

      # Must be another dashboard GUID
      filter_current_dashboard = true
    }

    widget_line {
      title  = "Average transaction duration and the request per minute, by application"
      row    = 4
      column = 7
      width  = 6
      height = 3

      nrql_query {
        account_id = 12345
        query      = "FROM Transaction SELECT average(duration) FACET appName"
      }

      nrql_query {
        query = "FROM Transaction SELECT rate(count(*), 1 minute)"
      }
    }

    widget_markdown {
      title  = "Dashboard Note"
      row    = 7
      column = 1
      width  = 12
      height = 3

      text = "### Helpful Links\n\n* [New Relic One](https://one.newrelic.com)\n* [Developer Portal](https://developer.newrelic.com)"
    }

    variable {
      default_values     = ["value"]
      is_multi_selection = true
      item {
        title = "item"
        value = "ITEM"
      }
      name = "variable"
      nrql_query {
        account_ids = [12345]
        query       = "FROM Transaction SELECT average(duration) FACET appName"
      }
      replacement_strategy = "default"
      title                = "title"
      type                 = "nrql"
    }
  }
}