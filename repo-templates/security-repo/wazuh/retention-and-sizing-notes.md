# Retention and Sizing Notes

## Principle

Size from measured events and required service levels, not from a generic server specification. Wazuh Manager analysis, index storage/search, dashboard usage, and integrations have different resource profiles and may need separate scaling decisions.

## Discovery Inputs

| Input | What to measure |
| --- | --- |
| Agents | Current count, growth, operating systems, intermittently connected and ephemeral assets |
| Log volume | Average and peak events/bytes per second and compressed/uncompressed GB per day, by source |
| Retention | Searchable, warm, archive, deletion, and legal-hold periods by data type |
| Index growth | Indexed size after parsing, mappings, replicas, and operational headroom |
| Alert volume | Alerts per rule/severity/day, bursts, correlation windows, and notification fan-out |
| Search workload | Concurrent analysts, query windows, saved searches, reports, and API consumers |
| Availability | Recovery time, recovery point, maintenance, failure-domain, and upgrade objectives |
| Growth | New environments, log sources, use cases, regulatory changes, and seasonal peaks |

Measure raw events and generated alerts separately. Retaining every collected event has a different cost and privacy profile from retaining alerts only.

## Working Estimate

Use a measured pilot to populate a planning model:

```text
daily_indexed_volume = measured_daily_source_volume x observed_index_factor
searchable_capacity = daily_indexed_volume x searchable_days x replica_factor
planned_capacity = searchable_capacity x growth_factor x operational_headroom
```

The factors are environment-specific. Compression, field mappings, shards, replicas, index lifecycle, event shape, and query patterns can materially change the result. Validate with representative peak traffic and failure conditions.

## Manager Considerations

- agent connections and reconnection bursts;
- event decoding and rule-evaluation rate;
- expensive regex or high-cardinality correlation rules;
- file integrity, inventory, compliance, and vulnerability-detection workloads;
- queue and buffer behavior during network or indexer disruption;
- cluster coordination and configuration distribution where applicable;
- CPU, memory, disk latency, file descriptors, and network throughput;
- upgrade, backup, and failover windows.

Alert count alone is not a manager-sizing metric: many events may be decoded and evaluated without generating an alert.

## Index and Dashboard Considerations

- shard and replica design appropriate to node count and failure domains;
- predictable index lifecycle and deletion behavior;
- disk watermarks and enough free space for merges, recovery, and upgrades;
- mapping growth and high-cardinality fields such as URI or request identifiers;
- concurrent query cost, wide time ranges, exports, and scheduled reports;
- dashboard timeouts and saved searches that mask unhealthy queries;
- monitoring that distinguishes collection delay from indexing or visualization delay.

## Backup and Restore

Define what is backed up: manager configuration, custom decoders/rules, agent/group configuration, dashboard objects, index snapshots, certificates, and integration configuration. Keep secrets in the approved secret system rather than source backups.

Backups are not complete until restore is tested against defined RPO/RTO. Document version compatibility, encryption, access, retention, off-site or cross-failure-domain storage, and the order in which components are recovered.

## When to Split Components

Evaluate separation or clustering when:

- manager analysis competes with index/search workloads;
- ingest or agent growth exceeds validated single-node capacity;
- recovery or maintenance objectives cannot tolerate one failure domain;
- dashboard query load degrades event processing;
- storage lifecycle or compliance requires dedicated index capacity;
- multiple environments require stronger access, data, or blast-radius isolation;
- internet-facing or confidential customers require separate deployments.

Splitting components adds operational complexity and does not replace sizing tests. Confidential or materially different trust domains may require independent deployments rather than only logical dashboard separation.

## Capacity Review Triggers

Review estimates after adding a major source, changing retention or replicas, enabling a new Wazuh capability, onboarding a large agent group, modifying high-volume rules, changing dashboard/report behavior, or observing sustained threshold breaches. Record actual versus forecast use and revise the model.
