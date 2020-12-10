# Background

Reference Solutions are starter kits for our customers' top industries, beginning with advertising technology. By providing accelerators per industry or per use case, customers have a starting point with appropriate table structures, indexes, shard keys, canned queries, and dashboards.

In addition, other teams at SingleStore DB can use these kits, for example:

* Documentation: as examples in longer chapters such as query tuning
* Sales engineering: as demonstrations or foundations for proof of concept
* Field marketing: as reference materials in blog articles
* Engineering: as reference architectures to detect performance regressions
* Helios: to allow trial customers to deploy sample databases and queries on demand
* Sales: to assist sales development representatives in targeting particular sectors

# Assets

Within each kit, we provide the following:

* Solution Brief: industry background and instructions for how use to the kit.
* Sample schema: SQL scripts for creating databases, tables, and keys.
* Data generators: scripts that generate data sets that we can store in S3 and use as canonical sets for benchmarking. The sets come in small, medium, and large. For convenience, we expect customers to load the data via a pipeline. Additionally, loading via a pipeline demonstrates SingleStore DB's ability to answer queries while ingesting data. Nevertheless, the kit will include the scripts in case customers want to tweak them.
* Sample queries: canned SQL statements that cover common access patterns.
* Benchmarks: `dbbench` jobs and sample output that validate the performance of the schema and record the expected throughput of the queries. The benchmarks emphasize maintaining query performance under concurrent load and during data ingestion.
Sample dashboards: common queries rendered in a user-friendly format such as Power BI, Logi, Tableau, or Looker.
