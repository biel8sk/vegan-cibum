import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:vegan_cibum/data/service/http/api_service_http.dart';
@GenerateNiceMocks([MockSpec<ApiServiceHttp>()])
import 'recipe_repository_test.mocks.dart';

void main() {

  final repository = MockApiServiceHttp();
  test("deve retornar uma lista de receitas", () async{
    final listRecipe = await repository.fetchRecipe();
    expect(listRecipe, listRecipe.isNotEmpty);
  });
}