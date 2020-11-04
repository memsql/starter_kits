# Benchmarks

To validate the performance of this reference solution on your SingleStore cluster, use [dbbench](https://github.com/memsql/dbbench/blob/master/README.md) with a command line similar to this one:

```bash
dbbench --host=example.com --username=admin --password=12345 --intermediate-stats=false adtech.ini
```

The results below are from the `large` data sets on a SingleStoreDB `S2` cluster with 16 vCPUs, 128 GB RAM, and 2 TB of disk:

```
campaign facts: 100 transactions (17.524 TPS), latency 56.96827ms±8.024163ms; 0 rows (0.000 RPS), 100 queries (17.524 QPS); 0 aborts (0.000%), latency 0s±0s
Transactions:
 33.554432ms -  67.108864ms [    76]: ██████████████████████████████████████████████████
 67.108864ms - 134.217728ms [    20]: █████████████▏
134.217728ms - 268.435456ms [     4]: ██▋

impressions per campaign: 100 transactions (6.093 TPS), latency 164.034887ms±11.449111ms; 100 rows (6.093 RPS), 100 queries (6.093 QPS); 0 aborts (0.000%), latency 0s±0s
Transactions:
 67.108864ms - 134.217728ms [    25]: █████████████████▎
134.217728ms - 268.435456ms [    72]: ██████████████████████████████████████████████████
268.435456ms - 536.870912ms [     3]: ██

ctr_per_country: 100 transactions (5.565 TPS), latency 179.611536ms±10.634211ms; 23900 rows (1329.940 RPS), 100 queries (5.565 QPS); 0 aborts (0.000%), latency 0s±0s
Transactions:
 67.108864ms - 134.217728ms [    15]: █████████
134.217728ms - 268.435456ms [    83]: ██████████████████████████████████████████████████
268.435456ms - 536.870912ms [     2]: █▏
```
