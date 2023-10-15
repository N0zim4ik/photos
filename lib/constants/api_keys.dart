class ApiKeys {
  const ApiKeys._();

  static Map<String, String> query(String query, int? page) => {
        'query': query,
        'page': (page ?? 0).toString(),
      };
}
