abstract class CRUD {
  Future<bool> insert({required String tablename , required Map<String,dynamic> values});
  Future<bool> update({required String username,required int id});
  Future<bool> delete();
  Future<List<Map<String, Object?>>> select({required String tablename});
}