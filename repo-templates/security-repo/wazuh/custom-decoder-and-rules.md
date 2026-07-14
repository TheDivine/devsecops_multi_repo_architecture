# Custom Decoder and Rules

## Design Principles

- Prefer a WAF's stable one-line JSON and Wazuh's built-in JSON decoder where practical.
- Decode fields, not attack payloads. Keep fixtures sanitized and defensive.
- Check existing built-in and custom rules before allocating IDs or duplicating detections.
- Store custom manager files under `/var/ossec/etc/decoders/` and `/var/ossec/etc/rules/`; do not edit upgrade-managed ruleset files.
- Treat MITRE ATT&CK mappings as reviewed analytical context, not proof of attacker intent.
- Test both positive and negative fixtures before rollout.

The `/var/ossec` paths in this document target the stable Wazuh 4.14.x layout. Wazuh 5.0 beta changes the manager path and component model; do not reuse these paths in 5.x without migration review and runtime testing.

## Blueprint Event Schema

The examples use a synthetic, order-dependent format solely to make the decoder understandable:

```text
WAF_EVENT timestamp=<UTC_TIMESTAMP> srcip=<SOURCE_IP> method=<HTTP_METHOD> uri=<SANITIZED_URI> action=<ACTION> status=<STATUS> category=<CATEGORY> rule_id=<WAF_RULE_ID>
```

Native vendor logs will differ. Create a normalization contract and adapt the decoder; do not modify a production source to imitate this example without architecture review.

## Decoder Example

[`examples/sample-local-decoder.xml`](examples/sample-local-decoder.xml) extracts standard fields (`srcip`, `action`, `status`) and dynamic fields (`waf.timestamp`, `waf.method`, `waf.uri`, `waf.category`, `waf.rule_id`). The pattern intentionally rejects unexpected field order or whitespace so format drift is visible during tests.

If the source is JSON, validate whether the built-in decoder already exposes equivalent dynamic fields before maintaining a regex decoder.

## Rule ID Allocation

This blueprint reserves `100300-100399` for its WAF examples. Wazuh's documented custom range is broader, so the private implementation must maintain a central registry and prove that this subrange is unused in that manager or cluster.

| Range | Intended use |
| --- | --- |
| `100300-100309` | Base classification and action outcome |
| `100310-100319` | Attack category and HTTP status signals |
| `100320-100329` | Frequency/correlation rules |
| `100330-100389` | Environment-specific extensions after review |
| `100390-100399` | Reserved for tests or future migration |

## Included Defensive Rules

[`examples/sample-local-rules.xml`](examples/sample-local-rules.xml) demonstrates:

- base WAF events;
- blocked requests;
- suspicious events allowed by the WAF;
- SQL injection, cross-site scripting, and remote/local file inclusion categories;
- scanner or bot activity;
- suspicious URI classification;
- individual 403/404 responses and repeated 403/404 behavior from the same decoded source IP.

The examples match normalized category labels such as `sqli`; they do not contain working exploit payloads. Category mappings must be verified against the source WAF's documented semantics.

## Severity Model

Wazuh rule levels run from `0` through `16`. This blueprint uses a deliberately small set:

| Example level | Blueprint interpretation | Typical handling |
| --- | --- | --- |
| `3` | Context or low-priority event | Retain for correlation; no paging. |
| `5` | Blocked or denied activity | Dashboard and trend review. |
| `7-8` | Repeated or reconnaissance-like behavior | Queue for analyst review. |
| `10` | High-confidence attack category that was blocked or observed | High-priority triage and correlation. |
| `12` | Suspicious attack category reported as allowed | Urgent validation and escalation under the approved runbook. |

This is not a universal mapping. Final severity must combine detection confidence, WAF outcome, asset criticality, exposure, frequency, business impact, and corroborating evidence. A blocked request against a low-criticality test asset may be less urgent than an allowed request against a critical service.

## MITRE ATT&CK Mapping

The examples map normalized exploitation categories to `T1190` (Exploit Public-Facing Application) and scanner behavior to `T1595` (Active Scanning). These mappings are plausible classification aids only. Review current ATT&CK definitions, the actual event, and local threat model before adoption.

## Test and Promotion

1. Place the decoder and rule files in the approved non-production manager paths.
2. Feed one sanitized fixture per line into `/var/ossec/bin/wazuh-logtest`.
3. Confirm decoded fields and the final rule ID/level; use verbose mode when troubleshooting.
4. Test benign requests, malformed lines, unknown categories, and trusted automated traffic.
5. Test the correlation rule with events inside and outside its time window.
6. Peer-review the regex, rule hierarchy, MITRE mapping, performance, and data exposure.
7. Promote through change control with backup, rollback, monitoring, and an owner.

Version-specific validation belongs in the private implementation repository. For the current stable baseline, run the sample through a pinned Wazuh 4.14.6 manager before adoption. The sample XML is intentionally not installed or activated by this blueprint.

## Official References

- [Wazuh decoders](https://documentation.wazuh.com/current/user-manual/ruleset/decoders/index.html)
- [Wazuh custom rules](https://documentation.wazuh.com/current/user-manual/ruleset/rules/custom.html)
- [Wazuh rule syntax](https://documentation.wazuh.com/current/user-manual/ruleset/ruleset-xml-syntax/rules.html)
- [Wazuh logtest](https://documentation.wazuh.com/current/user-manual/reference/tools/wazuh-logtest.html)
