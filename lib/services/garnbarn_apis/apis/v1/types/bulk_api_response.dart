class BulkApiResponse<T> {
  final Function? next;
  final Function? previous;
  final int count;
  final List<T> results;

  BulkApiResponse(this.next, this.previous, this.count, this.results);
}
