resource "aws_wafregional_ipset" "waf_whitelis_set" {
  name = "${upper(var.common_tags["Environment"])}-WAF-WHITELIST-SET"

  ip_set_descriptor = "${var.waf_whitelisted_ip_sets}"

  lifecycle {
    ignore_changes = ["ip_set_descriptor"]
  }
}

resource "aws_wafregional_ipset" "waf_blacklist_set" {
  count = "${local.LogParserActivated}"
  name  = "${upper(var.common_tags["Environment"])}-WAF_BLACKLIST-SET"

  lifecycle {
    ignore_changes = ["ip_set_descriptor"]
  }
}

resource "aws_wafregional_ipset" "waf_http_flood_set" {
  count = "${local.LogParserActivated}"
  name  = "${upper(var.common_tags["Environment"])}-WAF-HTTP-FLOOD-SET"

  lifecycle {
    ignore_changes = ["ip_set_descriptor"]
  }
}

resource "aws_wafregional_ipset" "waf_scans_probes_set" {
  count = "${local.LogParserActivated}"
  name  = "${upper(var.common_tags["Environment"])}-WAF-SCANS-PROBES-SET"

  lifecycle {
    ignore_changes = ["ip_set_descriptor"]
  }
}

resource "aws_wafregional_ipset" "waf_reputation_lists_set1" {
  count = "${local.ReputationListsProtectionActivated}"
  name  = "${upper(var.common_tags["Environment"])}-WAF-REPUTATION-LISTS-SETS1"

  lifecycle {
    ignore_changes = ["ip_set_descriptor"]
  }
}

resource "aws_wafregional_ipset" "waf_reputation_lists_set2" {
  count = "${local.ReputationListsProtectionActivated}"
  name  = "${upper(var.common_tags["Environment"])}-WAF-REPUTATION-LISTS-SETS2"

  lifecycle {
    ignore_changes = ["ip_set_descriptor"]
  }
}

resource "aws_wafregional_ipset" "waf_badbot_set" {
  count = "${local.BadBotProtectionActivated}"
  name  = "${upper(var.common_tags["Environment"])}-WAF-BADBOT-SET"

  lifecycle {
    ignore_changes = ["ip_set_descriptor"]
  }
}