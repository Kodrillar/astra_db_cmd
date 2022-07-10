class AstraDbCredential {
  const AstraDbCredential({
    required this.astraDbId,
    required this.astraDbRegion,
    required this.keyspace,
  });
  final String astraDbId;
  final String astraDbRegion;
  final String keyspace;
}
