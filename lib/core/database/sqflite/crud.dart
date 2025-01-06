abstract class CRUD {
  Future<void> insert();
  Future<void> update();
  Future<void> delete();
  Future<void> select();
}