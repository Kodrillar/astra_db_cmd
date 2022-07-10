class AstraDbCredential {
  const AstraDbCredential({
    required this.astraDbId,
    required this.astraDbRegion,
    required this.keyspace,
    required this.astraDbToken,
  });
  final String astraDbId;
  final String astraDbRegion;
  final String keyspace;
  final String astraDbToken;
}
