abstract class CRUD {
  Future<bool> insert({required String tablename , required Map<String,dynamic> values});
  Future<bool> update({required String tablename ,required Map<String,Object> values,required String where});
  Future<bool> delete({required String tablename,required String where});
  Future<List<Map<String, Object?>>> select({required String tablename});
}