# Benchmarks

To validate the performance of this reference solution on your SingleStore DB cluster, use [dbbench](https://github.com/memsql/dbbench/blob/master/README.md) with a command line similar to this one:

```bash
dbbench --host=example.com --username=admin --password=12345 --intermediate-stats=false adtech.ini
```

The results below are from the `large` data sets on a SingleStore DB `S0` cluster with 2 vCPUs, 16 GB RAM, and 256 GB of disk:

```
campaign facts: 30 transactions (8.308 TPS), latency 120.300883ms±44.343461ms; 0 rows (0.000 RPS), 30 queries (8.308 QPS); 0 aborts (0.000%), latency 0s±0s
Transactions:
 67.108864ms - 134.217728ms [    28]: ██████████████████████████████████████████████████
134.217728ms - 268.435456ms [     1]: █▊
268.435456ms - 536.870912ms [     0]: 
536.870912ms - 1.073741824s [     1]: █▊

spend per advertiser: 30 transactions (4.386 TPS), latency 227.96454ms±68.407821ms; 15870 rows (2320.170 RPS), 30 queries (4.386 QPS); 0 aborts (0.000%), latency 0s±0s
Transactions:
 67.108864ms - 134.217728ms [     6]: ███████████████▊
134.217728ms - 268.435456ms [    19]: ██████████████████████████████████████████████████
268.435456ms - 536.870912ms [     4]: ██████████▌
536.870912ms - 1.073741824s [     1]: ██▋

impressions per campaign: 30 transactions (0.746 TPS), latency 1.340303697s±212.908291ms; 30 rows (0.746 RPS), 30 queries (0.746 QPS); 0 aborts (0.000%), latency 0s±0s
Transactions:
1.073741824s - 2.147483648s [    29]: ██████████████████████████████████████████████████
2.147483648s - 4.294967296s [     1]: █▋

ctr_per_country: 30 transactions (0.696 TPS), latency 1.436779262s±269.644705ms; 7170 rows (166.336 RPS), 30 queries (0.696 QPS); 0 aborts (0.000%), latency 0s±0s
Transactions:
536.870912ms - 1.073741824s [     3]: █████▊
1.073741824s - 2.147483648s [    26]: ██████████████████████████████████████████████████
2.147483648s - 4.294967296s [     1]: █▉
```
