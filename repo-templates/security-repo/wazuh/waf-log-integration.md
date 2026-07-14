# WAF Log Integration Pattern

## Purpose

This pattern connects a WAF or reverse proxy to Wazuh without assuming a specific vendor. SafeLine running in Docker is one possible source; equivalent controls apply to another WAF, ingress proxy, NGINX deployment, or managed edge service.

## Integration Contract

Define and approve a log contract before writing a decoder.

| Contract field | Required decision |
| --- | --- |
| Source | `<WAF_PRODUCT_AND_VERSION>` on `<WAF_HOST>` |
| File or stream | `<WAF_LOG_PATH>` or approved API/syslog source |
| Format | JSON preferred where stable; otherwise a documented one-line schema |
| Time | UTC or documented offset, synchronized source, explicit timestamp field |
| Request identity | Request or correlation ID that can be joined to proxy/application logs |
| Network fields | Trusted client-source field, destination/service context, proxy chain handling |
| Security outcome | Normalized `blocked`, `allowed`, `challenged`, or `observed` action |
| Detection category | Stable categories such as `sqli`, `xss`, `lfi`, `rfi`, `scanner`, or `suspicious_uri` |
| Sensitive fields | Fields to redact, hash, omit, or restrict before collection |
| Volume | Average and peak bytes/events per second plus rotation behavior |

Do not collect full request bodies, cookies, authorization headers, or exploit payloads by default. Minimize data to the fields required for triage and evidence.

## Agent-Side Collection

The agent needs read access to the approved log and an appropriate `localfile` entry. Adapt the safe fragment in [`examples/ossec-agent-logcollection-example.xml`](examples/ossec-agent-logcollection-example.xml):

```xml
<localfile>
  <location>/var/log/&lt;WAF_LOG_PATH&gt;</location>
  <log_format>syslog</log_format>
</localfile>
```

The escaped placeholder keeps the example valid XML; replace it only in the private implementation. Use `json` when the source emits supported one-line JSON. Confirm how the agent behaves during rotation, container recreation, delayed file creation, and permission changes. For Docker-based WAFs, prefer a documented host-mounted log path or supported logging driver over reading an unstable container-internal path.

## Manager-Side Decoder

Use the built-in JSON decoder where it reliably exposes the required fields. Create a custom decoder only for a stable format that is not already decoded. Keep local decoders under `/var/ossec/etc/decoders/` and version their source in the private security repository.

The sample decoder expects the sanitized `WAF_EVENT` schema in [`examples/sample-waf-log-lines.txt`](examples/sample-waf-log-lines.txt). Treat it as a test fixture, not a claim about SafeLine or another product's native schema.

## Manager-Side Rules

Rules should evaluate normalized fields rather than raw payloads where possible. The sample range `100300-100399` covers this blueprint only and must be checked against the target manager's complete custom rule inventory.

Start with these outcomes:

- establish a low-severity base event;
- distinguish blocked from allowed suspicious requests;
- classify SQLi, XSS, LFI/RFI, scanner/bot, and suspicious URI signals;
- correlate repeated 403/404 behavior over a bounded interval;
- attach reviewed severity, groups, owner, and MITRE ATT&CK mapping.

See [Custom Decoders and Rules](custom-decoder-and-rules.md) and the safe files under [`examples/`](examples/).

## Testing Approach

1. Capture sanitized, representative benign, blocked, allowed, malformed, and rotated-log samples.
2. Baseline the unmodified manager to identify existing decoders and rules.
3. Run each one-line fixture through `/var/ossec/bin/wazuh-logtest` in a non-production manager.
4. Verify the decoder name, extracted fields, final rule ID, severity, groups, and MITRE mapping.
5. Add negative tests for normal health checks, static assets, approved scanners, and expected 404 traffic.
6. Replay a representative volume to measure ingest, rule cost, alert rate, and dashboard behavior.
7. Peer-review the change, record expected outcomes, and validate rollback before controlled rollout.

Saved decoder/rule changes can be exercised by `wazuh-logtest`; applying them to live event processing requires the environment's approved manager change procedure.

## False-Positive Tuning

- Confirm the event is decoded correctly before changing a rule.
- Normalize health checks, trusted automation, static resources, and known scanner identifiers with narrow conditions.
- Prefer scoped child rules, thresholds, time windows, and approved lists over global suppression.
- Never trust a source solely by a user-controlled header or unverified client IP.
- Record every exception with business reason, owner, scope, compensating control, expiry, and review date.
- Test that the tuned rule still detects the original security outcome and nearby variants.

## Rollout Steps

1. Approve the architecture, fit assessment, data contract, owners, retention, and capacity estimate.
2. Integrate one non-production source and preserve sanitized baseline measurements.
3. Validate collection reliability, field quality, rules, dashboards, notification routes, and rollback.
4. Run in observe-only or limited-notification mode for an agreed period.
5. Tune with documented evidence and obtain detection-owner approval.
6. Expand by controlled asset group, monitoring ingest and alert quality at each stage.
7. Complete handover, support documentation, exception tracking, and periodic review scheduling.

Stop or roll back when collection harms the source host, sensitive data is exposed, ingest exceeds capacity, events cannot be attributed reliably, or alert ownership is unavailable.
